context("MUS")

n=620
k=3
n1=20
n2=100
n3=500
x=matrix(NA, n,2)
gruppovero=c( rep(1,n1), rep(2, n2), rep(3, n3))

for (i in 1:n1){
  x[i,]=rmvnorm(1, c(1,5), sigma=diag(2))
}
for (i in 1:n2){
  x[n1+i,]=rmvnorm(1, c(4,0), sigma=diag(2))
}
for (i in 1:n3){
  x[n1+n2+i,]=rmvnorm(1, c(6,6), sigma=diag(2))
}
cl <-cutree(hclust(dist(x), "average"),k)
 # KMeans(x,k)

#Faccio girare H volte il kmeans

H=1000
a=matrix(NA, H, n)

for (h in 1:H){
  a[h,]=kmeans(x,k)$cluster

}

sim_matr <- matrix(1, n,n)

for (i in 1:(n-1)){
  for (j in (i+1):n){
    sim_matr[i,j] <- sum(a[,i]==a[,j])/H
    sim_matr[j,i] <- sim_matr[i,j]
  }
}


prec_par=5
mus_res=MUS_alg(sim_matr, cl, prec_par)
pivots=mus_res$massimi
