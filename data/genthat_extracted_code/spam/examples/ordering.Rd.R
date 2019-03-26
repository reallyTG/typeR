library(spam)


### Name: ordering
### Title: Extract the permutation
### Aliases: ordering ordering.spam ordering-methods ordering.spam.chol
###   ordering.spam.chol.NgPeyton ordering,spam-method
###   ordering,matrix-method
### Keywords: algebra

### ** Examples

# Construct a pd matrix S to work with (size n)
n <- 100    # dimension
S <- .25^abs(outer(1:n,1:n,"-"))
S <- as.spam( S, eps=1e-4)
I <- diag(n)  # Identity matrix

cholS <- chol( S)
ord <- ordering(cholS)
iord <- ordering(cholS, inv=TRUE)

R <- as.spam( cholS ) # R'R = P S P', with P=I[ord,],
  # a permutation matrix (rows permuted).
RtR <- t(R) %*% R

# the following are equivalent:
as.spam( RtR -            S[ord,ord] )
as.spam( RtR[iord,iord] - S )
as.spam( t(R[,iord]) %*% R[,iord] - S )

# trivially:
as.spam( t(I[iord,]) - I[ord,])  # (P^-1)' = P  
as.spam( t(I[ord,]) - I[,ord])  # 
as.spam( I[iord,] - I[,ord])
as.spam( I[ord,]%*%S%*%I[,ord] - S[ord,ord] )
   # pre and post multiplication with P and P' is ordering



