library(lsr)


### Name: independentSamplesTTest
### Title: Independent samples t-test
### Aliases: independentSamplesTTest

### ** Examples


df <- data.frame( 
	rt = c(451, 562, 704, 324, 505, 600, 829), 
	cond = factor( x=c(1,1,1,2,2,2,2), labels=c("group1","group2")))

# Welch t-test
independentSamplesTTest( rt ~ cond, df )

# Student t-test
independentSamplesTTest( rt ~ cond, df, var.equal=TRUE )

# one sided test
independentSamplesTTest( rt ~ cond, df, one.sided="group1" )

# missing data
df$rt[1] <- NA
df$cond[7] <- NA
independentSamplesTTest( rt ~ cond, df )




