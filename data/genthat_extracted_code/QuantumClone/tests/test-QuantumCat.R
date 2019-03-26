# Test generation
context("Phylogenetic generation")

test_that("Cellularity is higher than 0", {
    set.seed(123)
    result<-TRUE
    for(s in 1:5){
      for(i in 1:2){
       QCat<-QuantumCat(number_of_clones = 4,number_of_mutation = 100, depth = 100, number_of_samples = s) 
       for(samp in 1:s){
         if(sum(QCat[[samp]]$Alt<0, na.rm = TRUE) + 
            sum(QCat[[samp]]$Alt<0, na.rm = TRUE)+
            sum(QCat[[samp]]$Cellularit<0,na.rm = TRUE )
         ){
           result <- FALSE
         }
         if(sum(is.na(QCat[[samp]]))){
           result <- FALSE
         }
       }
      }
    }

    expect_true(result)
})


