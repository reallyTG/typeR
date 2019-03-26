library(MTurkR)


### Name: GrantBonus
### Title: Pay Bonus to Worker
### Aliases: GrantBonus bonus paybonus
### Keywords: Workers

### ** Examples

## Not run: 
##D # Grant a single bonus
##D a <- "A1RO9UEXAMPLE"
##D b <- "26XXH0JPPSI23H54YVG7BKLEXAMPLE"
##D c <- ".50"
##D d <- "Thanks for your great work on my HITs!\nHope to work with you, again!"
##D GrantBonus(workers=a, assignments=b, amounts=c, reasons=d)
## End(Not run)
## Not run: 
##D # Grant bonuses to multiple workers
##D a <- c("A1RO9EXAMPLE1","A1RO9EXAMPLE2","A1RO9EXAMPLE3")
##D b <- 
##D c("26XXH0JPPSI23H54YVG7BKLEXAMPLE1",
##D "26XXH0JPPSI23H54YVG7BKLEXAMPLE2",
##D "26XXH0JPPSI23H54YVG7BKLEXAMPLE3")
##D c <- c(".50",".10",".25")
##D d <- "Thanks for your great work on my HITs!"
##D GrantBonus(workers=a, assignments=b, amounts=c, reasons=d)
## End(Not run)



