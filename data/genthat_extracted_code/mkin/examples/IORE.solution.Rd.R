library(mkin)


### Name: IORE.solution
### Title: Indeterminate order rate equation kinetics
### Aliases: IORE.solution
### Keywords: manip

### ** Examples

  plot(function(x) IORE.solution(x, 100, 0.2, 1.3), 0, 2, 
	                               ylim = c(0, 100))
  fit.fomc <- mkinfit("FOMC", FOCUS_2006_C, quiet = TRUE)
  fit.iore <- mkinfit("IORE", FOCUS_2006_C, quiet = TRUE)
  fit.iore.deS <- mkinfit("IORE", FOCUS_2006_C, solution_type = "deSolve", quiet = TRUE)

  print(data.frame(coef(fit.fomc), coef(fit.iore), coef(fit.iore.deS), 
                   row.names = paste("model par", 1:3)))
  print(rbind(fomc = endpoints(fit.fomc)$distimes, iore = endpoints(fit.iore)$distimes, 
              iore.deS = endpoints(fit.iore)$distimes))



