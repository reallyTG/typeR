context("Validation tools tests")

test_that("NMI computation is correct", {
  cluster<-c(rep(1,6),rep(2,6),rep(3,5))
  truth<-c(rep(1,5),2,
           1,rep(2,4),3,
           rep(1,2),rep(3,3))
  
  expect_identical(round(NMI_cutree(cluster,truth),digits = 2),0.36)
}
)

test_that("RI,Precision,Recall,F1 computation are correct", {
  cluster<-c(rep(1,6),rep(2,6),rep(3,5))
  truth<-c(rep(1,5),2,
           1,rep(2,4),3,
           rep(1,2),rep(3,3))
  result<-Precision_Recall(hx = cluster,truth)
  expect_identical(round(c(result$Pr,
                           result$R,
                           result$F1,
                           result$RI),
                         digits = 2),
                   c(0.5,0.45,0.48,0.68)
                   )
}
)
