#' @author Lech Madeyski
library(reproducer)
context("MetaAnalysisForFamiliesOfExperimentsSR")

newTolerance <- 0.001

test_that('adjexact=calculateSmallSampleSizeAdjustment(df=c(5,10,17))', {
  adjexact=calculateSmallSampleSizeAdjustment(df=c(5,10,17))
  expect_equal(adjexact[1], 0.8407487, tolerance = newTolerance)
  expect_equal(adjexact[2], 0.9227456, tolerance = newTolerance)
  expect_equal(adjexact[3], 0.9551115, tolerance = newTolerance)
})

test_that('adjexact=calculateSmallSampleSizeAdjustment(df=c(5,10,17),FALSE)', {
  adjapprox=calculateSmallSampleSizeAdjustment(df=c(5,10,17),FALSE)
  expect_equal(adjapprox[1], 0.8421053, tolerance = newTolerance)
  expect_equal(adjapprox[2], 0.9230769, tolerance = newTolerance)
  expect_equal(adjapprox[3], 0.9552239, tolerance = newTolerance)
})


test_that('constructEffectSizes(10, 15, 0.3, 0.2, 15, 15)',{
  EffectSizes=constructEffectSizes(10, 15, 0.3, 0.2, 15, 15)
  expect_equal(EffectSizes$GlassDelta, 16.66667, tolerance = newTolerance)
  expect_equal(EffectSizes$Cohend, 20.29995, tolerance = newTolerance)
  expect_equal(EffectSizes$Hedgesg, 19.61161, tolerance = newTolerance)
  expect_equal(EffectSizes$r, 0.9948402, tolerance = newTolerance)
  expect_equal(EffectSizes$HedgesgAdjusted, 19.08077, tolerance = newTolerance)
})

test_that('constructEffectSizes(Mc, Mt, SDc,SDt,Nt,Nc)',{
  Mt = c(0.633, 0.673, 0.423, 0.727, 0.631)
  Mc = c(0.612, 0.526, 0.356, 0.618, 0.534)
  SDt = c(0.198, 0.115, 0.172, 0.088, 0.122)
  SDc = c(0.159, 0.089, 0.111, 0.166, 0.119)
  Nt = c(12, 12, 14, 10, 8)
  Nc= c(12, 12, 14, 10, 8)
  EffectSizes=constructEffectSizes(Mc, Mt, SDc,SDt,Nt,Nc)
  expect_equal(EffectSizes$GlassDelta, c(0.1320755, 1.6516854, 0.6036036, 0.6566265, 0.8151261), tolerance = newTolerance)
  expect_equal(EffectSizes$Cohend, c(0.1221516, 1.4931812, 0.4803405, 0.8648343, 0.8604924), tolerance = newTolerance)
  expect_equal(EffectSizes$Hedgesg, c(0.1169513, 1.4296121, 0.4628677, 0.8204538, 0.8049169), tolerance = newTolerance)
  expect_equal(EffectSizes$r, c(0.05837591, 0.58151846, 0.22547423, 0.37953300, 0.37335594), tolerance = newTolerance)
  expect_equal(EffectSizes$HedgesgAdjusted, c(0.1129107, 1.3802200, 0.4493641, 0.7857047, 0.7608781), tolerance = newTolerance)
})


test_that('transformRtoZr(0.4)',{
  Zr=transformRtoZr(0.4)
  expect_equal(Zr, 0.4236489, tolerance = newTolerance)
})

test_that('transformRtoZr( c(0.4, 0.2) )',{
  Zr=transformRtoZr( c(0.4, 0.2) )
  expect_equal(Zr, c(0.4236489, 0.2027326), tolerance = newTolerance)
})


test_that('transformZrtoR(0.4236489)',{
  r=transformZrtoR(0.4236489)
  expect_equal(r, 0.4, tolerance = newTolerance)
})

test_that('transformZrtoR( c(0.4, 0.2) )',{
  r=transformZrtoR(c(0.4236489, 0.2027326))
  expect_equal(r, c(0.4, 0.2), tolerance = newTolerance)
})


test_that('transformHgtoR(0.4, 20, 20)',{
  r=transformHgtoR(0.4, 20, 20)
  expect_equal(r, 0.1961161, tolerance = newTolerance)
})

test_that('calculateHg(10, 15, 20, 20, 2, 2)',{
  Hg=calculateHg(10, 15, 20, 20, 2, 2)
  expect_equal(Hg$Hg, 2.5, tolerance = newTolerance)
  expect_equal(Hg$HgAdjusted, 2.450276, tolerance = newTolerance)
})


test_that('transformRtoHg(c(0.4,0.2), c(20,20), c(20,20))',{
  Hg=transformRtoHg(c(0.4,0.2), c(20,20), c(20,20))
  expect_equal(Hg, c(0.8728716, 0.4082483), tolerance = newTolerance)
})


test_that('transformZrtoHgapprox(c(0.4,0.2))',{
  HgApprox=transformZrtoHgapprox(c(0.4,0.2))
  expect_equal(HgApprox, c(0.8215047, 0.4026720), tolerance = newTolerance)
})

test_that('transformZrtoHg(0.5, 20, 20)',{
  HgApprox=transformZrtoHg(0.5, 20, 20)
  expect_equal(HgApprox, 1.042191, tolerance = newTolerance)
})

test_that('PrepareForMetaAnalysisGtoR(c(10,10), c(12,14), c(4,4), c(4,4), c(20,20), c(40,40))',{
  results=PrepareForMetaAnalysisGtoR(c(10,10), c(12,14), c(4,4), c(4,4), c(20,20), c(40,40))
  expect_equal(results$HGvalues.Hg, c(0.5, 1.0), tolerance = newTolerance)
  expect_equal(results$HGvalues.HgAdjusted, c(0.4935018, 0.9870036), tolerance = newTolerance)
  expect_equal(results$Hgupper, c(1.082017, 1.634701), tolerance = newTolerance)
  expect_equal(results$Hglower, c(-0.06156572, 0.40620071), tolerance = newTolerance)
  expect_equal(results$zr, c(0.2305901, 0.4499419), tolerance = newTolerance)
  expect_equal(results$vi, c(0.01754386, 0.01754386), tolerance = newTolerance)
  expect_equal(results$r, c(0.2265882, 0.4218513), tolerance = newTolerance)
  expect_equal(results$pvalue, c(0.0816981743, 0.0006813222), tolerance = newTolerance)
})



test_that('ExtractMAStatistics(S1MA, sum(S1data$Nc),sum(S1data$Nt), TRUE, "d", 4)',{
  ExpData=reproducer::KitchenhamMadeyskiBrereton.ExpData
  #Extract the experiment basic statics
  S1data=subset(ExpData,ExpData=="S1")
  #Use the descriptive data to construct effect size
  S1EffectSizes = reproducer::PrepareForMetaAnalysisGtoR(S1data$Mc,
  S1data$Mt,S1data$SDc,S1data$SDt,S1data$Nc,S1data$Nt)
  # Do a random effect meta-analysis of the transformed r_pbs effect size
  S1MA = metafor::rma(S1EffectSizes$zr, S1EffectSizes$vi)
  # Extract summary statistics from meta-analysis results and transform back to Hg scale
  S1MAStats=reproducer::ExtractMAStatistics(S1MA, sum(S1data$Nc),sum(S1data$Nt), TRUE, "d", 4)
  expect_equal(S1MAStats$mean, 0.6658, tolerance = newTolerance)
  expect_equal(S1MAStats$pvalue, 0.002069, tolerance = newTolerance)
  expect_equal(S1MAStats$UB, 1.122, tolerance = newTolerance)
  expect_equal(S1MAStats$LB, 0.2384, tolerance = newTolerance)
  expect_equal(S1MAStats$QE, 4, tolerance = newTolerance)
  expect_equal(S1MAStats$QEp, 0.41, tolerance = newTolerance)
})


test_that('aggregateIndividualDocumentStatistics(10, 2, 20, 15, 2, 20)',{
  stats=aggregateIndividualDocumentStatistics(10, 2, 20, 15, 2, 20)
  expect_equal(stats$M, 12.5, tolerance = newTolerance)
  expect_equal(stats$SD, 2, tolerance = newTolerance)
})

