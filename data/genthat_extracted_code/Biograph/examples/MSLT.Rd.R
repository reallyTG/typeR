library(Biograph)


### Name: MSLT
### Title: Multistate life table: survival function and exposure function
### Aliases: MSLT MSLT.e MSLT.S

### ** Examples

#	a. The multistate life table based on Nelson-Aalen estimators 
#	The example obtains Nelson-Aalen estimators of the cumulative transition rates 
# using the mavna package. It derives the multistate life survival function 
# from the transition rates and the expected sojourn times from the survival function. 
# The radix is the number of persons by state at the reference age 
# (e.g. at the start of the life history).
    data(GLHS)
    z <- Parameters (GLHS)
    cr <- Cumrates (irate=3,Bdata=GLHS)
    S.e <- MSLT.S(cr$astr[,,,1])  # expected
    radix <- c(10000,0)
    mslt.e <- MSLT.e (S.e,radix)
    S.u <- MSLT.S(cr$astr[,,,2])  # upper
    mslt.u <- MSLT.e (S.u,radix)
    S.l <- MSLT.S(cr$astr[,,,3])  # lower
    mslt.l <- MSLT.e (S.l,radix)
    	
# b. The multistate life table based on occurrence-exposure rates
    cr <- Cumrates (irate=3,Bdata=GLHS)
    S <- MSLT.S(cr$oe)
    radix <- c(10000,0)
    mslt <- MSLT.e (S,radix)



