### library(getmstatistic); library(testthat); Sys.setenv(NOT_CRAN="true")

### see also:
###     Magosi LE, Goel A, Hopewell JC, Farrall M, on behalf of the CARDIoGRAMplusC4D Consortium (2017) 
###     Identifying systematic heterogeneity patterns in genetic association meta-analysis studies. 
###     PLoS Genet 13(5): e1006755. https://doi.org/10.1371/journal.pgen.1006755


context("Checking getmstatistic example: Run M analysis on all 214 lead variants in heartgenes214 dataset: ")


test_that("correct systematic outlier studies are identified for M analysis of 214 lead variants.", {


	### Test may take longer than 1 min hence test will be run locally rather than on CRAN
	skip_on_cran()

	### Load libraries
	library(gridExtra)

	   
	### Load heartgenes214 dataset
	### ?heartgenes214 to view the dataset documentation
	data(heartgenes214, package="getmstatistic")


	### Run M analysis on all 214 lead variants in heartgenes214 dataset
	### To view getmstatistic documentation ?getmstatistic or ?getm
	getmstatistic_results <- getmstatistic(heartgenes214$beta_flipped, 
											heartgenes214$gcse, 
											heartgenes214$variants, 
											heartgenes214$studies)


	### Retrieve dataset of stronger than average studies (significant at 5% level)
	stronger_studies <- getmstatistic_results$influential_studies_0_05

 
	### Retrieve dataset of weaker than average studies (significant at 5% level)
	weaker_studies <- getmstatistic_results$weaker_studies_0_05

 
	### Retrieve number of studies and variants
	num_studies <- getmstatistic_results$number_studies
	num_variants <- getmstatistic_results$number_variants
 

	### Retrieve expected mean, sd and critical M value at 5% significance level
	mstat_mean <- getmstatistic_results$M_expected_mean
	mstat_sd <- getmstatistic_results$M_expected_sd
	mstat_crit_alpha <- getmstatistic_results$M_crit_alpha_0_05


	### compare with results in getmstatistic vignette at url:
	###     https://github.com/magosil86/getmstatistic/blob/master/vignettes/getmstatistic-tutorial.md

	### checking M statistic expected mean
	expect_equal(mstat_mean, 0)

	### checking M statistic expected sd
	expect_equal(round(mstat_sd, 4), 0.0684)

	### checking critical M value at 5% significance level
	expect_equal(round(mstat_crit_alpha, 3), 0.224)

	### checking number of studies and variants
	expect_equal(num_variants, 214)
	expect_equal(num_studies, 48)


	### checking identity of systematic outlier studies showing stronger than average effects
	expect_equal(as.character(stronger_studies$Study), c("15", "38", "48", "07"))

	### checking M statistic values of systematic outlier studies showing stronger than average effects
	expect_equal(round(stronger_studies$M, 3), round(c(0.2354221, 0.2817610, 0.3164090, 0.3553257), 3))

	### checking identity of systematic outlier studies showing weaker than average effects
	expect_equal(as.character(weaker_studies$Study), c("10", "28", "41", "40"))

	### checking M statistic values of systematic outlier studies showing weaker than average effects
	expect_equal(round(weaker_studies$M, 3), round(c(-0.3540737, -0.2442751, -0.2319262, -0.2262017), 3))


	### Results should also resemble S7_Table in M statistic paper
	### S7 Table. Studies showing systematic heterogeneity patterns across 214 FDR ≤ 5% lead 
	###           variants in the CARDIoGRAMplusC4D GWAS meta-analysis at threshold alpha = 0.05.
	###           https://doi.org/10.1371/journal.pgen.1006755.s016

	### Note: M statistic scatterplot should also resemble S4_Fig in M statistic paper

})
