# Reproducible test on optim vs optimx

set.seed(123)

Start.data<-QuantumCat(4,100,"AB",contamination = c(0.3,0.3))

mb<-microbenchmark::microbenchmark(test1<-One_step_clustering(SNV_list = Start.data,
                                                              contamination =  c(0.3,0.3),
                                                              simulated = T,maxit = 1,
                                                              optim = "optimx",ncores = 1,
                                                              save_plot = FALSE),
                                   test2<-One_step_clustering(SNV_list = Start.data,
                                                              contamination =  c(0.3,0.3),
                                                              simulated = T,maxit = 1,
                                                              optim = "default",ncores = 1,
                                                              save_plot =FALSE),
                                   times = 3
)

### Compare NMI ... 