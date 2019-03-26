context("Clustering quality and options")

test_that("Returns correct clustering",{
  set.seed(123)
  SNVs<-QuantumCat(number_of_clones = 2,number_of_mutations = 100,number_of_samples = 1,ploidy = "AB")
  
  cellularities<-SNVs[[1]]$Cellularit[sapply(1:2,function(z){
    which(SNVs[[1]]$Chr==z)[1]
  })]/100
  weights<-sapply(1:2, function(z){
    sum(SNVs[[1]]$Chr==z)
  })/nrow(SNVs[[1]])
  test<-QuantumClone::Probability.to.belong.to.clone(SNV_list=SNVs,
                                       clone_weights = weights,
                                       clone_prevalence=cellularities,
                                       contamination=0
  )
  expect_equal(sum(test$cluster!=SNVs[[1]]$Chr),0)
}
)
