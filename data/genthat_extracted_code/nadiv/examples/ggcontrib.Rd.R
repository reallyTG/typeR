library(nadiv)


### Name: ggcontrib
### Title: Genetic group contribution
### Aliases: ggcontrib

### ** Examples


# Use the pedigree from Quaas 1988 (See `data(Q1988)`)
##########################
# Fuzzy classification
  ## Fuzzy classification with complete assignment to one group
    Q1988fuzz <- Q1988[-c(1:2), c("id", "phantomDam", "phantomSire")]
    Qfnull <- matrix(c(1,0,0,1,0, 0,1,1,0,1), nrow = 5, ncol = 2,
	dimnames = list(letters[1:5], c("g1", "g2")))
    (Qfuzznull <- ggcontrib(Q1988fuzz, fuzz = Qfnull))

    ## Should be identical to the non-fuzzy classification output
    # format (1) from above
      (Q <- ggcontrib(Q1988[-c(3:7), c(1,4,5)]))
    stopifnot(Qfuzznull == Q)

  ## Fuzzy classification with arbitrary assignments
    Qf <- matrix(c(1,0,0.5,0.5,0.5, 0,1,0.5,0.5,0.5), nrow = 5, ncol = 2,
	dimnames = list(letters[1:5], c("g1", "g2")))
    (Qfuzz <- ggcontrib(Q1988fuzz, fuzz = Qf))  

  ## Using the pedigree and fuzzy classification in Fikse (2009)
    F2009fuzz <- data.frame(id = c(letters[1:7], LETTERS[1:6]),
	dam = c(rep(NA, 7), "a", "c", "e", "A", "C", "D"),
	sire = c(rep(NA, 7), "b", "d", "f", "B", "g", "E"))
    Ff <- matrix(c(1,0,1,0,0,0,0.2,
		0,1,0,0.6,0,0.3,0.4,
		0,0,0,0.4,1,0.7,0.4),
		nrow = 7, ncol = 3,
		dimnames = list(letters[1:7], paste0("g", 1:3)))
    # Actual Q matrix printed in Fikse (2009)
      Fikse2009Q <- matrix(c(0.5,0.5,0,0.5,0.1,0.3,
			0.5,0.3,0.15,0.4,0.275,0.3375, 
			0,0.2,0.85,0.1,0.625,0.3625),
		nrow = 6, ncol = 3,
		dimnames = list(LETTERS[1:6], paste0("g", seq(3))))

    Ffuzz <- ggcontrib(F2009fuzz, fuzz = Ff)
      (diffFfuzz <- Ffuzz - Fikse2009Q)
      # Encountering some rounding error
      stopifnot(length((drop0(diffFfuzz, tol = 1e-12))@x) == 0)


##########################
# Non-fuzzy classification
  # format (1) from above
    Q1 <- Q1988[-c(3:7), c(1,4,5)]
    (gg1 <- ggcontrib(Q1, ggroups = NULL)) # note the warning message which is typical

  # format (2) from above
    Q2 <- Q1988[-c(1:7), 1:3]
    # arbitrarily assign individuals genetic groups for unknown parents
    ## Means gg2 is NOT comparable to gg1 or gg3!
    ggvec.in <- c("g1", "g2", "g1", NA)
    (gg2 <- ggcontrib(Q2, ggroups = ggvec.in))

  # format (3) from above
    Q3 <- Q1988[-c(1:7), c(1,4,5)]
    gg3 <- ggcontrib(Q3, ggroups = c("g1", "g2"))

  stopifnot(gg1 == gg3)




