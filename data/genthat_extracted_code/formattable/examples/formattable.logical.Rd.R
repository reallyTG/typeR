library(formattable)


### Name: formattable.logical
### Title: Create a formattable logical vector
### Aliases: formattable.logical

### ** Examples

logi <- c(TRUE, TRUE, FALSE)
flogi <- formattable(logi, "yes", "no")
flogi
!flogi
any(flogi)
all(flogi)



