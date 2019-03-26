library(operators)


### Name: withOptions
### Title: Alternative option mechanism
### Aliases: options with.options
### Keywords: programming

### ** Examples

	
	# part of ?glm
	counts <- c(18,17,15,20,10,20,25,13,12)
  outcome <- gl(3,1,9)
  treatment <- gl(3,3)
  print(d.AD <- data.frame(treatment, outcome, counts))
  glm.D93 <- glm(counts ~ outcome + treatment, family=poisson())
	
	summary( glm.D93 )
	
	with( options(show.signif.stars = FALSE,show.coef.Pvalues=FALSE), 
		summary( glm.D93) )
	
	a <- try( 
	  with( options( warn = 2) , warning( "more than a warning" ) ), 
		silent = TRUE )
  class( a )



