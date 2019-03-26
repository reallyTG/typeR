library(CEGO)


### Name: benchmarkGeneratorQAP
### Title: Create Quadratic Assignment Problem (QAP) Benchmark
### Aliases: benchmarkGeneratorQAP

### ** Examples

set.seed(1)
n=5
#ceate a flow matrix
A <- matrix(0,n,n) 
for(i in 1:n){
	for(j in i:n){
		if(i!=j){
			A[i,j] <- sample(100,1)
			A[j,i] <- A[i,j]
 	}
	}
}
#create a distance matrix
locations <- matrix(runif(n*2)*10,,2)
B <- as.matrix(dist(locations))
#create QAP objective function 
fun <- benchmarkGeneratorQAP(A,B)
#evaluate
fun(1:n)
fun(n:1)




