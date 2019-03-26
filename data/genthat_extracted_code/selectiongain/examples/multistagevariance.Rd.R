library(selectiongain)


### Name: multistagevariance
### Title: Expected variance after selection after k stages selection
### Aliases: multistagevariance
### Keywords: Truncated multivariate normal

### ** Examples


# first example

Q =c(0.4308,0.9804,1.8603)

corr=matrix( c(1,       0.3508,0.3508,0.4979,
               0.3508,  1,     0.3016,0.5630,
               0.3508,  0.3016,1,     0.5630,
               0.4979,  0.5630,0.5630,1), 
              nrow=4  
)


multistagevariance(Q=Q,corr=corr,alg=Miwa)

# time comparsion

var.time.miwa=system.time (var.miwa<-multistagevariance(Q=Q,corr=corr,alg=Miwa))

var.time.bretz=system.time (var.bretz<-multistagevariance(Q=Q,corr=corr))



# second examples 


Q= c(0.9674216, 1.6185430)
corr=matrix( c(1,         0.7071068, 0.9354143,
               0.7071068, 1,         0.7559289,
               0.9354143, 0.7559289, 1), 
              nrow=3  
)


multistagevariance(Q=Q,corr=corr,alg=Miwa)

var.time.miwa=system.time (var.miwa<-multistagevariance(Q=Q, corr=corr, alg=Miwa))

var.time.bretz=system.time (var.bretz<-multistagevariance(Q=Q, corr=corr))




# third examples 

 alpha1<- 1/(24)^0.5
 alpha2<- 1/(24)^0.5
 Q=multistagetp(alpha=c(alpha1,alpha2),corr=corr)


corr=matrix( c(1,         0.7071068,0.9354143,
               0.7071068, 1,        0.7559289,
               0.9354143, 0.7559289,1), 
              nrow=3  
)

multistagevariance(Q=Q, corr=corr, alg=Miwa)




