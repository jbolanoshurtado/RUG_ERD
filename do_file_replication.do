*************************************
* Assignment 6 : Replications		*
*-----------------------------------*
* Experimental Research Design		*
* ReMa Economics and Business - RUG *
*************************************

* Jean Pierre Bolaños Hurtado (S4637879)

clear 		all
set more 	off

*Checking experiment 1 (t-test)
********************************

* (A) Main t-test
*-----------------

/* What we know:
n = 77
group1: negative outcome valence (cost)
group2: positive outcome valence (gain)
t-test assumptions
0) the pop. dist. of the mean diff. between groups should be normal
1) equal variance in the population variance of the outcome
-> not tested
2) adjustment for unequal variance
-> not performed
t-test results reported
group 1: 
	mean: 2.31 words
	SD: 1.20 words 
	variance: 1.44 words*words
group 2:
	mean: 1.71 words
	SD: 1.09 words
	variance: 1.1881 words*words
Reported results
	t-value: -2.29
	p-value:  <.05
*/

*I) reverse engineering the group subsample size
ttesti	38 2.31 1.2 39 1.71 1.09 
ttesti	39 2.31 1.2 38 1.71 1.09 // this is the case
*--> so n1=39, n2=38, diff=0.6 (CI: 0.080-1.120), pval: 0.0245

*II) what happens if variances are unequal
sdtesti 39 . 1.2 38 . 1.09 // ok they are equal

*III) effect sizes (Cohen's D)
esizei	39 2.31 1.2 38 1.71 1.09, cohensd
* cohen's d: 0.523, CI: 0.067 - 0.976

*IV) power achieved = 0.620
	/* -------> OUTPUT GPOWER 3.1.9.7
	[1] -- Thursday, January 20, 2022 -- 10:31:12
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	Post hoc: Compute achieved power 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.523
		α err prob	=	0.05
		Sample size group 1	=	39
		Sample size group 2	=	38
	Output:	Noncentrality parameter δ	=	2.2944597
		Critical t	=	1.9921022
		Df	=	75
		Power (1-β err prob)	=	0.6198452
	-------------------------------------------
	*/
*V) Required sample size for minimum power of 0.8 = 118 obs
	/* -----> Required sample size to get minimum adequate power
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	A priori: Compute required sample size 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.523
		α err prob	=	0.05
		Power (1-β err prob)	=	0.80
		Allocation ratio N2/N1	=	1
	Output:	Noncentrality parameter δ	=	2.8406171
		Critical t	=	1.9806260
		Df	=	116
		Sample size group 1	=	59
		Sample size group 2	=	59
		Total sample size	=	118
		Actual power	=	0.8042954
	-------------------------------------------
	***>>>> Total sample size for Power of 0.8 is 118 participants
	*/
*V) Required sample size for adequate power of 0.9 = 159
	/* -----> Required sample size to get optimal power
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	A priori: Compute required sample size 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.523
		α err prob	=	0.05
		Power (1-β err prob)	=	0.90
		Allocation ratio N2/N1	=	1
	Output:	Noncentrality parameter δ	=	3.2661340
		Critical t	=	1.9754881
		Df	=	154
		Sample size group 1	=	78
		Sample size group 2	=	78
		Total sample size	=	156
		Actual power	=	0.9007323
	-------------------------------------------
	*/

* B) Familiwise error rate: post-hoc t-tests 
*-------------------------------------------

/* what we know
>First post-hoc t-test only for positive words (Range: 1-3)
group1 = negative valence
	mean = 1.31
	sd = 0.92
group2 = positive valence
	mean = 0.84
	sd = 0.86
Test results
	t-value = -2.30
	p-value =  <.05

>Second post-hoc t-test only for negative words (Range: 1-3)
group1 = negative valence
	n= 		39 participants
	mean = 	0.97 words
	sd = 	0.84 words
group2 = positive valence
	n= 		38 participants
	mean = 	0.61 words
	sd = 	0.60 words
Test results
	t-value = -2.22
	p-value =  <.05
*/
* (B.1) POSITIVE words t-tests
*I) replicating the t-test
ttesti	39 1.31 0.92 38 0.84 0.86
* diff=0.47 (CI: 0.065-0.875), pval: 0.0234

*II) what happens if variances are unequal
sdtesti	39 1.31 0.92 38 0.84 0.86 // variances are equal


*III) effect sizes (Cohen's D)
esizei	39 1.31 0.92 38 0.84 0.86, cohensd
* cohen's d: 0.528, CI: 0.071 - 0.980

*IV) power achieved = 0.628
/*
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	Post hoc: Compute achieved power 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.528
		α err prob	=	0.05
		Sample size group 1	=	39
		Sample size group 2	=	38
	Output:	Noncentrality parameter δ	=	2.3163952
		Critical t	=	1.9921022
		Df	=	75
		Power (1-β err prob)	=	0.6280612
------------------------------------------------
*/
*V) Required sample size for minimum power of 0.8 = 116 obs
/*
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	A priori: Compute required sample size 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.528
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Allocation ratio N2/N1	=	1
	Output:	Noncentrality parameter δ	=	2.8433670
		Critical t	=	1.9809923
		Df	=	114
		Sample size group 1	=	58
		Sample size group 2	=	58
		Total sample size	=	116
		Actual power	=	0.8049334
*/
*V) Required sample size for adequate power of 0.9 = 154 obs
/*
	Analysis:	A priori: Compute required sample size 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.528
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Allocation ratio N2/N1	=	1
	Output:	Noncentrality parameter δ	=	3.2761538
		Critical t	=	1.9756939
		Df	=	152
		Sample size group 1	=	77
		Sample size group 2	=	77
		Total sample size	=	154
		Actual power	=	0.9024126
*/

* (B.2) NEGATIVE words t-tests
*I) replicating the t-test
ttesti	39 0.97 0.84 38 0.61 0.60
* diff=0.36 (CI: 0.027-0.692), pval: 0.0340

*II) what happens if variances are unequal
sdtesti	39 0.97 0.84 38 0.61 0.60 // variances are unequal
*re do t-test
ttesti	39 0.97 0.84 38 0.61 0.60, unequal
* diff=0.36 (CI: 0.029-0.691), pval: 0.0336

*III) effect sizes (Cohen's D)
esizei	39 0.97 0.84 38 0.61 0.60, cohensd unequal
* cohen's d: 0.492, CI: 0.036 - 0.944

*IV) power achieved = 0.568
/*
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	Post hoc: Compute achieved power 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.492
		α err prob	=	0.05
		Sample size group 1	=	39
		Sample size group 2	=	38
	Output:	Noncentrality parameter δ	=	2.1584592
		Critical t	=	1.9921022
		Df	=	75
		Power (1-β err prob)	=	0.5678327
------------------------------------------------
*/
*V) Required sample size for minimum power of 0.8 = 132 obs
/*
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	A priori: Compute required sample size 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.492
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Allocation ratio N2/N1	=	1
	Output:	Noncentrality parameter δ	=	2.8263248
		Critical t	=	1.9783804
		Df	=	130
		Sample size group 1	=	66
		Sample size group 2	=	66
		Total sample size	=	132
		Actual power	=	0.8010636
*/
*V) Required sample size for adequate power of 0.9 = 176 obs
/*
	t tests - Means: Difference between two independent means (two groups)
	Analysis:	A priori: Compute required sample size 
	Input:	Tail(s)	=	Two
		Effect size d	=	0.492
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Allocation ratio N2/N1	=	1
	Output:	Noncentrality parameter δ	=	3.2635588
		Critical t	=	1.9736914
		Df	=	174
		Sample size group 1	=	88
		Sample size group 2	=	88
		Total sample size	=	176
		Actual power	=	0.9006964
*/


* Family-wise error rate for the three t-tests on the same data
*1) t-test 1 (all words) p-value = 0.0245
*2) t-test 2 (pos words) p-value = 0.0234
*3) t-test 3 (neg words) p-value = 0.0340

*Bonferroni new alpha = alpha / # t-tests
di 0.05/3 // new alpha is 0.016666

* adjusted t-tests and Bonferroni adjCI's --> 1-(0.05/3)% CI --> 98.33%CI's
ttesti	39 2.31 1.20 38 1.71 1.09, level(98.33) // all words
ttesti	39 1.31 0.92 38 0.84 0.86, level(98.33) // pos words
ttesti	39 0.97 0.84 38 0.61 0.60, level(98.33) unequal // neg words
* Result, they all become insignificant: adjCI's:
*1) t-test 1 (all words) Bonferroni CI's = [-0.040 - 1.240]
*2) t-test 2 (pos words) Bonferroni CI's = [-0.027 - 0.967]
*3) t-test 3 (neg words) Bonferroni CI's = [-0.047 - 0.767]

* Bonferroni adjusted CI of the effect sizes
esizei	39 2.31 1.20 38 1.71 1.09, level(98.33) cohensd // allwords
esizei	39 1.31 0.92 38 0.84 0.86, level(98.33) cohensd // poswords
esizei	39 0.97 0.84 38 0.61 0.60, level(98.33) cohensd unequal // negwords
* Result, they all become too wide: adjCI's:
*1) t-test 1 (all words) Bonferroni CI's = [-0.035 - 1.076]
*2) t-test 2 (pos words) Bonferroni CI's = [-0.029 - 1.081]
*3) t-test 3 (neg words) Bonferroni CI's = [-0.064 - 1.045]


*Checking experiment 2 (ANOVA)
******************************

* (A) Main test: ANOVA

/*
* What we know:
n = 76
Analysis technique: TWO -WAY (between effects) ANOVA

Criterion: 
	Appropriateness of offer (sum of 3 Likert scales, range 1-7, CA=0.81)
First factor:
	group1: negative outcome valence (cost)
	group2: positive outcome valence (gain)
Second factor:
	HIGH: high dependency upon the recipient
	LOW:  low dependency upon the recipient

NOTE: assume even factorial distribution of the cells

Statistical null test in two-way ANOVA
mean(group1&HIGH) = mean(group1&LOW) = mean(group2&HIGH) = mean(group2&LOW)

Assumptions to be tested:
1) The outcome pop. dist. from which the samples are obtained is normal
	(this was not tested)
2) Conditions are independent 
	(yes by design)
3) Population variance of conditions must be equal
	(I am going to test this) Impossible to test
4) Conditions must have the same sample sizes
	(We assume it is balanced but it is not explicit in the article)
	
The F-test: [Sum of condition variances (btw)] / [error variance (within)]
*/

*There are no basic descriptive statistics!!!! I cannot replicate findings!
*The only thing I can replicate is the main difference of outcome valences
ttesti		38 5.56 1.13 38 4.72 0.99 // very significant
sdtesti 	38 5.56 1.13 38 4.72 0.99 // homogeneous 
esizei		38 5.56 1.13 38 4.72 0.99 
* cohen's d is good and healthy: 0.791, CI: 0.321 - 1.256

*****
* We know the ETA squared of outcome valence is 0.14!

/* Transformation of eta squared to Cohen's f

ANOVA reported result:
F(1,72)=11.48, pval=<.001, eta square = 0.14

Then the relationship between Cohen's f and eta squared is:
f2 = eta2 / (1-eta2)
f2 = 0.14 / (1-0.14)
f2 = 0.14/0.86
f2 = 0.16279
f  = sqrt(0.16279) = 0.4035
Cohen's f is 0.4035 for an ETA2 of 0.14
*/


* The only thing I can test is the achieved power: 0.163 (very low!)
/*               GPOWER 3.1.9.7 OUTPUT
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	Post hoc: Compute achieved power 
	Input:	Effect size f	=	0.4034733
		α err prob	=	0.05
		Total sample size	=	76
		Numerator df	=	72
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	12.3720935
		Critical F	=	1.4773763
		Denominator df	=	72
		Power (1-β err prob)	=	0.1629357
*/
* What is the sample size to see this effect with adequate power: 256 obs
/* LOG GPOWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.4034733
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Numerator df	=	72
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	41.6744202
		Critical F	=	1.3455783
		Denominator df	=	252
		Total sample size	=	256
		Actual power	=	0.8023513
*/
* What is the sample size to see this effect with good power: 304 obs
/* LOG GPOWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.4034733
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Numerator df	=	72
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	49.4883740
		Critical F	=	1.3367335
		Denominator df	=	300
		Total sample size	=	304
		Actual power	=	0.9000724
*/



*Checking experiment 2 (ANOVA)
******************************

* (A) Main test ANOVA on chip allocation

/*
* What we know:
n = 100
Analysis technique: TWO -WAY (between effects) ANOVA

Criterion: 
	Chip allocation (Range: 0 to 100)
First factor:
	group1: negative outcome valence (cost)
	group2: positive outcome valence (gain)
Second factor:
	HIGH: high dependency upon the recipient
	LOW:  low dependency upon the recipient

NOTE: assume even factorial distribution of the cells (25obs per cell)

ATTEMPTING TO RECONSTRUCT THE ANOVA TABLE

---------------------------------------------------------------------
dependency x valence	|	Positive val	Negative val |	Total
------------------------+--------------------------------+-----------
High dependency			|	mu= 47.44		mu=	46.24	 |	mu= 46.16
						|	sd= 10.92		sd= 15.24	 |	sd= 13.13
						|								 |
Low dependency			|	mu= 33.73		mu=	46.04	 |	mu= 40.05
						|	sd= 18.62		sd= 11.79	 |	sd= 16.76
------------------------+--------------------------------+-----------
TOTAL					|	mu= 			mu=			 |
						|	sd= 			sd= 		 |	
---------------------------------------------------------------------

Individual F-tests results reported and ETA squared for each
1) Main effect of dependency
F(1,96)=5.71, pval<.05, ETA squared = 0.06

2) Interaction effect dependency x valence
F(1,96)=5.40, pval<.05, ETA squared = 0.05

3) Efect of valence was only significant in low dependency
F(1,96)=8.94, pval<.005, ETA squared = 0.09

4) Effect of dependency was only significant in the positive valence
F(1,96)=11.33, pval<.001, ETA squared = 0.11

*/

** The minimum I can test without the data is equality of variances+power

*1) Equality of variances assuming normality: Bartlett's test by hand
** getting the variances from the reported SD's:
** vars: POSxHIGH POSxLOW NEGxHIGH NEGxLOW
di 10.92^2
di 18.62^2 
di 15.24^2
di 11.79^2  
/* results: 
var(POSxHIGH) = 119.2464
var(POSxLOW)  = 346.7044
var(NEGxHIGH) = 232.2576
var(NEGxLOW)  = 139.0041
*/
di (10.92^2 + 18.62^2 + 15.24^2 + 11.79^2)
*SUM of the variances = 837.2125
di 24 * (10.92^2 + 18.62^2 + 15.24^2 + 11.79^2) / 96
* S^2_p = 209.30312
di ln(10.92^2)
di ln(18.62^2)
di ln(15.24^2)
di ln(11.79^2)
di ln((24 * (10.92^2 + 18.62^2 + 15.24^2 + 11.79^2) / 96))
* Getting T
di (96 * ln((24 * (10.92^2 + 18.62^2 + 15.24^2 + 11.79^2) / 96)) 	///
	- 24 * (ln(10.92^2) + ln(18.62^2) + ln(15.24^2) + ln(11.79^2))) ///
	/ (1 + (1/9) * ((1/6) - (1/96))) 
* Bartlett's equal variance test T val = 8.5661437

* produce a Chi2 distribution with 3 df
local 	df 	  = 3
local   alpha0 = 0.10
local   alpha1 = 0.05
local	alpha2 = 0.01
local	alpha3 = 0.001
di   	invchi2(3, 0.90)  //  6.2513886
di   	invchi2(3, 0.95)  //  7.8147279
di   	invchi2(3, 0.99)  // 11.344867
di   	invchi2(3, 0.999) // 16.266236

range 	confidence 0 1 2001
gen 	chi2crit = invchi2(3,confidence)
line 	chi2crit confidence, xline(0.95, lcolor(red)) xline(0.9, lcolor(blue)) xline(0.99, lcolor(green)) note("Note: Blue, red, and green are critical values at p=0.10, p=0.05, and p=0.01 respectively")
list	confidence chi2crit if confidence > 0.8999 & confidence < 0.9001
list	confidence chi2crit if confidence > 0.9499 & confidence < 0.9501
list	confidence chi2crit if confidence > 0.9899 & confidence < 0.9901
list	confidence chi2crit if confidence > 0.9989 & confidence < 0.9991

* critical values corroborated

* to graph the CHI2
*drop chi2 dens_chi2
range 		chi2 0 20 2001
gen     	dens_chi2 = chi2den(3,chi2)
kdensity 	dens_chi2
histogram 	dens_chi2
label var 	chi2 "Chi square critical value"
label var 	dens_chi2 "Chi square prob. density "
line 		dens_chi2 chi2, ///
				ytitle("Chi squre probability density") ///
				title("Chi square distribution") ///
				subtitle("degrees of freedom = 3") ///
				xtitle("Critical Value") ///
				note("Red line: Bartlett's equal variance T value = 8.566" ///
				"Chi square critical values: 6.25 (p<.1), 7.81 (p<.05), 11.34 (p<.01)") xline(8.5661437)
				

gen 		areachi2 = .
replace		areachi2 = chi2 if chi2 > 7.82
gen			areadenschi2 = .
replace		areadenschi2 = dens_chi2 if chi2 > 7.82
gen 		floor = .
replace		floor = 0 if chi2 > 7.82
*list 		areadenschi2 areachi2 if areachi2 !=.
twoway 		(scatteri ///
0.0223574 7.82 	///
0.020667 8 		///
0.01644551 8.5 	///
0.0133548 9		///
0.0085004 10	///
0.0054074 11	///
0.0034256 12	///
0.0021626 13	///
0.0013612 14	///
0.0008546 15	///
0.0002645 17.5	///
0 20			///
 , bcolor(ltblue%70) lcolor(ltblue%70) recast(area) legend(on order(1 "p<.05 significance region" 2 "Chi square prob. density"))) (line dens_chi chi2, ///
				ytitle("Chi square probability density") ///
				title("ANOVA inequality of variance test (Bartlett's T)") ///
				subtitle("Chi square distribution with df= 3") ///
				xtitle("Critical Value") ///
				note("Notes:" "BLUE line: Bartlett's equal variance T value = 8.566" "Chi square critical values: 6.25 (p<.1), 7.81 (p<.05), 11.34 (p<.01)" "Assignment 6 - ERD - Jean Pierre Bolaños (S4637879)") xline(8.5661437, lcolor(blue)))

** Result, they are different so results from ANOVA are biased. A more strict p-value should be used.

* Analysing the eta2

*1) Main effect of dependency
*F(1,96)=5.71, pval<.05, ETA squared = 0.06 --> Cohen's f = 0.2526
*Summary:
* 	Achieved power:						0.0912
*	Required n to achieve 0.8 power: 	680
* 	Required n to achieve 0.9 power: 	816
/*
1) ACHIEVED POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	Post hoc: Compute achieved power 
	Input:	Effect size f	=	0.2526456
		α err prob	=	0.05
		Total sample size	=	100
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	6.3829799
		Critical F	=	1.4013317
		Denominator df	=	96
		Power (1-β err prob)	=	0.0912336

2) SAMPLE REQUIRED TO REACH 0.8 POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.2526456
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	43.3404337
		Critical F	=	1.2721352
		Denominator df	=	675
		Total sample size	=	679
		Actual power	=	0.8003178
	
3) SAMPLE REQUIRED TO REACH 0.9 POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.2526456
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	52.0212863
		Critical F	=	1.2682567
		Denominator df	=	811
		Total sample size	=	815
		Actual power	=	0.9003225			
*/


*2) Interaction effect dependency x valence
*F(1,96)=5.40, pval<.05, ETA squared = 0.05 --> Cohen's f = 0.2294
*Summary:
* 	Achieved power:						0.0828
*	Required n to achieve 0.8 power: 	814
* 	Required n to achieve 0.9 power: 	978

/*
1) ACHIEVED POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	Post hoc: Compute achieved power 
	Input:	Effect size f	=	0.2294157
		α err prob	=	0.05
		Total sample size	=	100
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	5.2631563
		Critical F	=	1.4013317
		Denominator df	=	96
		Power (1-β err prob)	=	0.0828145

2) SAMPLE REQUIRED TO REACH 0.8 POWER 
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.2294157
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	42.7894610
		Critical F	=	1.2683044
		Denominator df	=	809
		Total sample size	=	813
		Actual power	=	0.8005417

3) SAMPLE REQUIRED TO REACH 0.9 POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.2294157
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	51.4210374
		Critical F	=	1.2650347
		Denominator df	=	973
		Total sample size	=	977
		Actual power	=	0.9001689
*/


*3) Efect of valence was only significant in low dependency
*F(1,96)=8.94, pval<.005, ETA squared = 0.09 --> Cohen's f = 0.3145
*Summary:
* 	Achieved power:						0.1209
*	Required n to achieve 0.8 power: 	456
* 	Required n to achieve 0.9 power: 	544
/*
1) ACHIEVED POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	Post hoc: Compute achieved power 
	Input:	Effect size f	=	0.3144855
		α err prob	=	0.05
		Total sample size	=	100
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	9.8901130
		Critical F	=	1.4013317
		Denominator df	=	96
		Power (1-β err prob)	=	0.1209432
		
2) SAMPLE REQUIRED TO REACH 0.8 POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.3144855
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	45.0000140
		Critical F	=	1.2834977
		Denominator df	=	451
		Total sample size	=	455
		Actual power	=	0.8000072
		
3) SAMPLE REQUIRED TO REACH 0.9 POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.3144855
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	53.8022146
		Critical F	=	1.2778772
		Denominator df	=	540
		Total sample size	=	544
		Actual power	=	0.9006564

*/


*4) Effect of dependency was only significant in the positive valence
*F(1,96)=11.33, pval<.001, ETA squared = 0.11 --> Cohen's f = 0.3516
*Summary:
* 	Achieved power:						0.1449
*	Required n to achieve 0.8 power: 	374
* 	Required n to achieve 0.9 power: 	446
/*
1) ACHIEVED POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	Post hoc: Compute achieved power 
	Input:	Effect size f	=	0.3515615
		α err prob	=	0.05
		Total sample size	=	100
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	12.3595488
		Critical F	=	1.4013317
		Denominator df	=	96
		Power (1-β err prob)	=	0.1448732
	
2) SAMPLE REQUIRED TO REACH 0.8 POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.3515615
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	46.2247126
		Critical F	=	1.2908981
		Denominator df	=	370
		Total sample size	=	374
		Actual power	=	0.8016295
		
3) SAMPLE REQUIRED TO REACH 0.9 POWER
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.3515615
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	54.9999923
		Critical F	=	1.2842677
		Denominator df	=	441
		Total sample size	=	445
		Actual power	=	0.9009668
*/




* (B) Main test ANOVA on chip allocation

/* 
What we know from the reported results
n = 100 also. Note that this is a reuse of the same ddbb so
		familywise error rate applies (correction not done).
---------------------

Analysis technique: TWO -WAY (between effects) ANOVA

Criterion:
	Importance of fairness and self-interest motives (7 point Likerts)
First factor:
	group1: negative outcome valence (cost)
	group2: positive outcome valence (gain)
Second factor:
	HIGH: high dependency upon the recipient
	LOW:  low dependency upon the recipient
	
Impossible to reconstruct the ANOVA table so no equal variance testing
possible

Three ANOVAS were done here so multiple Bonferroni adjustments
should had been done, at least, 5 per ANOVA test so 15 in total
p-value critical would move from 0.05 to 0.05/15 --> 0.003


ETAs2 from ANOVAS reported:
------------------------------------
(1) [OJO AQUÍ hay o un TYPO o weird data handling bc df goes from 96->95
ANOVA: effect of valence on self-interest-only  scale
F(1,95)=7.94, pval=<.01, eta squared = 0.08

(2)
ANOVA: effect of valence on fairness-only scale
F(1,96)=12.00, pval=<.001, eta2 = 0.11 

*/

* checking actual power, and required sample size to replicate

* case (1) eta2 of effect of valence on self-interest = 0.08
* 	conversion to Cohen's f = 0.2949
*------------------------------------------------------------
* Summary
*	Achieved power			= 	0.1103
* 	Required n at 0.8 power = 	512 obs
* 	Required n at 0.9 power = 	612 obs

/* Logs from Gpower
(1) achieved power
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	Post hoc: Compute achieved power 
	Input:	Effect size f	=	0.2948839
		α err prob	=	0.05
		Total sample size	=	100
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	8.6956514
		Critical F	=	1.4013317
		Denominator df	=	96
		Power (1-β err prob)	=	0.1102561
		
(2) sample size for 0.8 power replication
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.2948839
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	44.5217354
		Critical F	=	1.2796760
		Denominator df	=	508
		Total sample size	=	512
		Actual power	=	0.8011602
		
(3) sample size for 0.9 power replication
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.2948839
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	53.2173869
		Critical F	=	1.2746720
		Denominator df	=	608
		Total sample size	=	612
		Actual power	=	0.9006177
*/
		
* case (2) eta2 of effect of valence on fairness = 0.11
* 	conversion to Cohen's f = 0.3516
*------------------------------------------------------------
* Summary
*	Achieved power			= 	0.1449
* 	Required n at 0.8 power = 	374 obs
* 	Required n at 0.9 power = 	446 obs

/* LOGS from GPOWER
(1) Achieved power
F tests - ANOVA: Fixed effects, special, main effects and interactions
Analysis:	Post hoc: Compute achieved power 
Input:	Effect size f	=	0.3515615
	α err prob	=	0.05
	Total sample size	=	100
	Numerator df	=	96
	Number of groups	=	4
Output:	Noncentrality parameter λ	=	12.3595488
	Critical F	=	1.4013317
	Denominator df	=	96
	Power (1-β err prob)	=	0.1448732


(2) required sample size for 0.8 power
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.3515615
		α err prob	=	0.05
		Power (1-β err prob)	=	0.8
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	46.2247126
		Critical F	=	1.2908981
		Denominator df	=	370
		Total sample size	=	374
		Actual power	=	0.8016295

(3) required sample size for 0.9 power
	F tests - ANOVA: Fixed effects, special, main effects and interactions
	Analysis:	A priori: Compute required sample size 
	Input:	Effect size f	=	0.3515615
		α err prob	=	0.05
		Power (1-β err prob)	=	0.9
		Numerator df	=	96
		Number of groups	=	4
	Output:	Noncentrality parameter λ	=	54.9999923
		Critical F	=	1.2842677
		Denominator df	=	441
		Total sample size	=	445
		Actual power	=	0.9009668
*/




* LAST:
* 	About the mediation model:
* It is impossible to validate the power of the estimates of the regresion
* model without the R2 or the partial effect f2 of the coefficients
* Not enough information is reported on the paper.







