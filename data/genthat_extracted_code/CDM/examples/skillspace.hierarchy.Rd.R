library(CDM)


### Name: skillspace.hierarchy
### Title: Creation of a Hierarchical Skill Space
### Aliases: skillspace.hierarchy skillspace.full
### Keywords: Skill hierarchy

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example with 3 skills
#############################################################################

K <- 3 # number of skills
skill.names <- paste0("A", 1:K )  # names of skills

# create a zero matrix for hierarchy definition
B0 <- 0*diag(K)
rownames(B0) <- colnames(B0) <- skill.names

#*** Model 1: A1 > A2 > A3
B <- B0
B[1,2] <- 1     # A1 > A2
B[2,3] <- 1     # A2 > A3

sp1 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
sp1$skillspace.reduced
  ##     A1 A2 A3
  ##   1  0  0  0
  ##   2  1  0  0
  ##   4  1  1  0
  ##   8  1  1  1

#*** Model 2:  A1 > A2 and A1 > A3
B <- B0
B[1,2] <- 1     # A1 > A2
B[1,3] <- 1     # A1 > A3

sp2 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
sp2$skillspace.reduced
  ##     A1 A2 A3
  ##   1  0  0  0
  ##   2  1  0  0
  ##   4  1  1  0
  ##   6  1  0  1
  ##   8  1  1  1

#*** Model 3: A1 > A3, A2 is not included in a hierarchical way
B <- B0
B[1,3] <- 1     # A1 > A3

sp3 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
sp3$skillspace.reduced
  ##     A1 A2 A3
  ##   1  0  0  0
  ##   2  1  0  0
  ##   3  0  1  0
  ##   4  1  1  0
  ##   6  1  0  1
  ##   8  1  1  1

#~~~ Hierarchy specification using strings

#*** Model 1: A1 > A2 > A3
B <- "A1 > A2
      A2 > A3"
sp1 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
sp1$skillspace.reduced

# Model 1 can be also written in one line for B
B <- "A1 > A2 > A3"
sp1b <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
sp1b$skillspace.reduced

#*** Model 2:  A1 > A2 and A1 > A3
B <- "A1 > A2
      A1 > A3"
sp2 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
sp2$skillspace.reduced

#*** Model 3: A1 > A3
B <- "A1 > A3"
sp3 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
sp3$skillspace.reduced

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Examples from Leighton et al. (2004): Fig. 1 (p. 210)
##D #############################################################################
##D 
##D skill.names <- paste0("A",1:6) # 6 skills
##D 
##D #*** Model 1: Linear hierarchy (A)
##D B <- "A1 > A2 > A3 > A4 > A5 > A6"
##D sp1 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
##D sp1$skillspace.reduced
##D 
##D #*** Model 2: Convergent hierarchy (B)
##D B <- "A1 > A2 > A3
##D       A2 > A4
##D       A3 > A5 > A6
##D       A4 > A5 > A6"
##D sp2 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
##D sp2$skillspace.reduced
##D 
##D #*** Model 3: Divergent hierarchy (C)
##D B <- "A1 > A2 > A3
##D       A1 > A4 > A5
##D       A1 > A4 > A6"
##D sp3 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
##D sp3$skillspace.reduced
##D 
##D #*** Model 4: Unstructured hierarchy (D)
##D B <- "A1 > A2 \n A1 > A3 \n A1 > A4 \n A1 > A5 \n A1 > A6"
##D # This specification of B is equivalent to writing separate lines:
##D # B <- "A1 > A2
##D #       A1 > A3
##D #       A1 > A4
##D #       A1 > A5
##D #       A1 > A6"
##D sp4 <- CDM::skillspace.hierarchy( B=B, skill.names=skill.names )
##D sp4$skillspace.reduced
## End(Not run)



