context("Testing the simulation of the bivariate negative binomial distribution")
set.seed(1)
kappa<- 3
p1 <- 0.1
p2 <- 0.85
p <- p1+p2
p0 <-1-p1-p2

y <- Bivariate_NBsim(100000,kappa,p1,p2)

expect_equal(base::mean(y[,1]),kappa*p1/(1-p),tolerance=0.01)
expect_equal(stats::var(y[,1]),kappa*p1*(1-p2)/(1-p)^2,tolerance=0.01)

expect_equal(base::mean(y[,2]),kappa*p2/(1-p),tolerance=0.01)
expect_equal(stats::var(y[,2]),kappa*p2*(1-p1)/(1-p)^2,tolerance=0.01)

expect_equal(stats::cor(y[,1],y[,2]),(p1*p2/(p0+p1)*(p0+p2))^(1/2),tolerance=0.1)


context("Testing the simulation of the bivariate logarithmic series distribution")
set.seed(1)
p1<-0.15
p2<-0.3

y<-Bivariate_LSDsim(1000, p1, p2)
expect_equal(base::mean(y[,1]), ModLSD_Mean(base::log(1-p2)/base::log(1-p1-p2),p1/(1-p2)), tolerance=0.1)
expect_equal(base::mean(y[,2]), ModLSD_Mean(base::log(1-p1)/base::log(1-p1-p2),p2/(1-p1)), tolerance=0.1)
expect_equal(stats::var(y[,1]), ModLSD_Var(base::log(1-p2)/base::log(1-p1-p2),p1/(1-p2)), tolerance=0.1)
expect_equal(stats::var(y[,2]), ModLSD_Var(base::log(1-p1)/base::log(1-p1-p2),p2/(1-p1)), tolerance=0.1)
expect_equal(stats::cor(y[,1],y[,2]), BivLSD_Cor(p1,p2),tolerance=0.1)
expect_equal(stats::cov(y[,1],y[,2]),BivLSD_Cov(p1,p2),tolerance=0.1)

context("Testing the simulation of the trivariate logarithmic series distribution")
set.seed(1)
p1<-0.15
p2<-0.25
p3<-0.55

y<-Trivariate_LSDsim(10000, p1, p2, p3)
expect_equal(base::mean(y[,1]), ModLSD_Mean(base::log(1-p2-p3)/base::log(1-p1-p2-p3),p1/(1-p2-p3)), tolerance=0.1)
expect_equal(base::mean(y[,2]), ModLSD_Mean(base::log(1-p1-p3)/base::log(1-p1-p2-p3),p2/(1-p1-p3)), tolerance=0.1)
expect_equal(base::mean(y[,3]), ModLSD_Mean(base::log(1-p1-p2)/base::log(1-p1-p2-p3),p3/(1-p1-p2)), tolerance=0.1)
expect_equal(stats::var(y[,1]), ModLSD_Var(base::log(1-p2-p3)/base::log(1-p1-p2-p3),p1/(1-p2-p3)), tolerance=0.1)
expect_equal(stats::var(y[,2]), ModLSD_Var(base::log(1-p1-p3)/base::log(1-p1-p2-p3),p2/(1-p1-p3)), tolerance=0.1)
expect_equal(stats::var(y[,3]), ModLSD_Var(base::log(1-p1-p2)/base::log(1-p1-p2-p3),p3/(1-p1-p2)), tolerance=0.1)

#Cor(X1,X2)
delta <- log(1-p3)/log(1-p1-p2-p3)
hatp1 <-p1/(1-p3)
hatp2<-p2/(1-p3)

expect_equal(stats::cov(y[,1],y[,2]), BivModLSD_Cov(delta,hatp1,hatp2), tolerance=0.1)
expect_equal(stats::cor(y[,1],y[,2]), BivModLSD_Cor(delta,hatp1,hatp2), tolerance=0.11)

#Cor(X1,X3)
delta <- log(1-p2)/log(1-p1-p2-p3)
hatp1 <-p1/(1-p2)
hatp2<-p3/(1-p2)

expect_equal(stats::cov(y[,1],y[,3]), BivModLSD_Cov(delta,hatp1,hatp2), tolerance=0.1)
expect_equal(stats::cor(y[,1],y[,3]), BivModLSD_Cor(delta,hatp1,hatp2), tolerance=0.1)

#Cor(X2,X3)
delta <- log(1-p1)/log(1-p1-p2-p3)
hatp1 <-p2/(1-p1)
hatp2<-p3/(1-p1)

expect_equal(stats::cov(y[,2],y[,3]), BivModLSD_Cov(delta,hatp1,hatp2), tolerance=0.1)
expect_equal(stats::cor(y[,2],y[,3]), BivModLSD_Cor(delta,hatp1,hatp2), tolerance=0.1)
