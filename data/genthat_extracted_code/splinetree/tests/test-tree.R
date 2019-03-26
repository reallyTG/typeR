context("Tree testing")

test_that("Testing Trees", {
  nlsySample_small <- nlsySample[nlsySample$ID %in% sample(unique(nlsySample$ID), 400),]
  tree1 <- splineTree(BMI~HISP+WHITE+BLACK+HGC_MOTHER+SEX, BMI~AGE, "ID",
                      nlsySample_small, degree=1, intercept=FALSE, cp=0.005)
  expect_is(tree1, "rpart")
  expect_true(projectedR2(tree1)>0)
  tree2k <- splineTree(BMI~HISP+WHITE+BLACK+HGC_MOTHER+SEX, BMI~AGE, "ID",
                       nlsySample_small, degree=2, df=4, intercept=TRUE, cp=0.005)
  expect_is(tree2k, "rpart")
  expect_true(treeSimilarity(tree1, tree2k) < 1)

  expect_true(yR2(tree2k) < 1)
  expect_true(projectedR2(tree2k, includeIntercept=FALSE) < 1)
  newdata = data.frame(HISP=0, WHITE=0, BLACK=1, HGC_MOTHER=13, SEX=2, AGE=24)
  pred = predictY(tree2k, newdata)
  expect_true(pred>0)

  stPrint(tree1)
  stPlot(tree1)
  stPrint(tree2k)
  stPlot(tree2k)
  terminalNodeSummary(tree1,  row.names(tree1$frame)[(tree1$frame$var=="<leaf>")][1])
  plotNode(tree1,  row.names(tree1$frame)[(tree1$frame$var=="<leaf>")][1])
})


