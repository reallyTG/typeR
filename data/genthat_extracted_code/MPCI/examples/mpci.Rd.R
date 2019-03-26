library(MPCI)


### Name: mpci
### Title: Multivariate Process Capability Index
### Aliases: mpci
### Keywords: mpci

### ** Examples


alpha <- 0.0027
Target <- c(2.2, 304.8, 304.8) 
LSL <- c(2.1, 304.5, 304.5)
USL <- c(2.3, 305.1, 305.1)
x <- matrix(c(2.196,2.184,2.135,2.140,2.119,2.163,2.145,2.209,2.227,2.277
,304.728,304.704,304.713,304.721,304.724,304.670,304.699,304.791,304.737
,304.859,304.798,304.746,304.680,304.719,304.767,304.792,304.753,304.816
,304.754,304.822),nrow = 10) # Matrix with three columns (quality 
# characteristics) and ten rows (number observations) 

#Computing the Shahriari et al. (1995) Multivariate Capability Vector

mpci(index="shah",x,LSL,USL,Target,alpha)

#Computing the Shahriari et al. (1995) index using only x and the
#specification limits (LSL and USL). 
#The function estimate the Target and assume alpha = 0.0027
rm(Target);rm(alpha) #Removing the parameters Target and alpha 
                     #previously defined.
mpci(index="shah",x,LSL,USL)

#Computing the Taam el al. (1993) Multivariate Capability Vector
alpha <- 0.0027
Target <- c(2.2, 304.8, 304.8) 
a <- mpci(index="taam",x,LSL,USL,Target,alpha)

#Performing the Pan and Lee. (2010) correction of the Multivariate Capability Index (NMCpm)
mpci(index="pan",x,LSL,USL,Target,alpha)

# Using the indices based on based on PCA

data("dataset1")
x<-dataset1
Target <- c(30, 70, 15, 12, 120) 
LSL <- c(24, 60, 10, 8, 100)
USL <- c(36, 80, 20, 16, 140)
alpha <- 0.05

# Computing the Wang and Chen (1998) Multivariate Process Capability Indices (MPCI)
# using the Bartlett's test to select how many principal components.
mpci(index="wang",x,LSL,USL,
         Target,
		 alpha = alpha,
		 Method = 4)

# Wang and Chen (1998) index using the default method (Method 1 or
# Percentage) and value of alpha
mpci(index="wang",x,LSL,USL)

# Xekalaki and Perakis (2002) Multivariate Process Capability Indices (MPCI)
# using the Bartlett's test to select how many principal components.
mpci(index="xeke",x,LSL,USL,
         Target,
		 alpha = alpha,
		 Method = 4)

# Xekalaki and Perakis (2002) using the default method (Method 1 or
# Percentage) and value of alpha
mpci(index="xeke",x,LSL,USL,Target)

# Wang (2005) Multivariate Process Capability Indices 
# using the Anderson's test to select how many principal components.
mpci(index="wangw",x,LSL,USL,
         Target,
		 alpha = alpha,
		 Method = 5)

#Computing the Wang (2005) using the Method 2 (Average)
mpci(index="wangw",x,LSL,USL,
         Target,
		 alpha = alpha,
		 Method = 2)





