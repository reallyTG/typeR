library(JMI)


### Name: JMI
### Title: Jackknife Mutual Information
### Aliases: JMI

### ** Examples

 x <- matrix(rnorm(50*3),50,3)
 y <- matrix(rnorm(50*2),50,2)
 #calculate the Jackknife Mutual information between x and y.
 JMI(x,y,0)$mi
 #calculate the p-value of independent test between x and y that based on 500 permutations.
 JMI(x,y,500)$pvalue





