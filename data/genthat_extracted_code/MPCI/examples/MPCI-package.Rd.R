library(MPCI)


### Name: MPCI-package
### Title: Multivariate Process Capability Indices (MPCI)
### Aliases: MPCI-package MPCI
### Keywords: package

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

#Performing the Taam et al. (1993) Multivariate Capability Index (MCpm)
mpci(index="taam",x,LSL,USL,Target,alpha)

#Performing the Pan and Lee. (2010) correction of the Multivariate Capability Index (NMCpm)
mpci(index="pan",x,LSL,USL,Target,alpha)

#Computing the Wang and Chen (1998) Multivariate Process Capability Indices(MPCI)
alpha = 0.05
mpci(index="wang", x,LSL,USL,Target)

#Performing the Xekalaki and Perakis (2002) MPCI.
mpci(index="xeke",x,LSL,USL,
          Target,
		  Method = 2)

#Computing the Wang (2005) MPCI
mpci(index="wangw",x,LSL,USL,
          Target,
		  Method = 1,
		  alpha = 0.05)




