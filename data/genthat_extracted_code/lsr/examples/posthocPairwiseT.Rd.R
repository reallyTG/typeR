library(lsr)


### Name: posthocPairwiseT
### Title: Post-hoc pairwise t-tests for ANOVA
### Aliases: posthocPairwiseT

### ** Examples
# create the data set to analyse: 	
dataset <- data.frame( 
            outcome = c( 1,2,3, 2,3,4, 5,6,7 ),
            group = factor(c( "a","a","a", "b","b","b","c","c","c")) 
           )

# run the ANOVA and print out the ANOVA table:
anova1 <- aov( outcome ~ group, data = dataset )
summary(anova1)

# Currently, the following two commands are equivalent:
posthocPairwiseT( anova1 )
pairwise.t.test( dataset$outcome, dataset$group )





