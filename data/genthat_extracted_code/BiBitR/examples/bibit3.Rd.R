library(BiBitR)


### Name: bibit3
### Title: The BiBit Algorithm with Noise Allowance guided by Provided
###   Patterns.
### Aliases: bibit3

### ** Examples

## Not run: 
##D  
##D set.seed(1)
##D data <- matrix(sample(c(0,1),100*100,replace=TRUE,prob=c(0.9,0.1)),nrow=100,ncol=100)
##D data[1:10,1:10] <- 1 # BC1
##D data[11:20,11:20] <- 1 # BC2
##D data[21:30,21:30] <- 1 # BC3
##D colsel <- sample(1:ncol(data),ncol(data))
##D data <- data[sample(1:nrow(data),nrow(data)),colsel]
##D 
##D pattern_matrix <- matrix(0,nrow=3,ncol=100)
##D pattern_matrix[1,1:7] <- 1
##D pattern_matrix[2,11:15] <- 1
##D pattern_matrix[3,13:20] <- 1
##D 
##D pattern_matrix <- pattern_matrix[,colsel]
##D 
##D 
##D out <- bibit3(matrix=data,minr=2,minc=2,noise=0.1,pattern_matrix=pattern_matrix,
##D               subpattern=TRUE,extend_columns=TRUE,pattern_combinations=TRUE)
##D out  # OR print(out) OR summary(out)
##D 
##D 
##D bibit3_patternBC(result=out,matrix=data,pattern=c(1),type=c("full","sub","ext"),BC=c(1,2))
## End(Not run)



