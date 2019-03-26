library(jmv)


### Name: corrMatrix
### Title: Correlation Matrix
### Aliases: corrMatrix

### ** Examples

## Not run: 
##D data('mtcars')
##D 
##D corrMatrix(mtcars, vars = vars(mpg, cyl, disp, hp))
##D 
##D #
##D #  CORRELATION MATRIX
##D #
##D #  Correlation Matrix
##D #  --------------------------------------------------------------
##D #                           mpg      cyl       disp      hp
##D #  --------------------------------------------------------------
##D #    mpg     Pearson's r        —    -0.852    -0.848    -0.776
##D #            p-value            —    < .001    < .001    < .001
##D #
##D #    cyl     Pearson's r                  —     0.902     0.832
##D #            p-value                      —    < .001    < .001
##D #
##D #    disp    Pearson's r                            —     0.791
##D #            p-value                                —    < .001
##D #
##D #    hp      Pearson's r                                      —
##D #            p-value                                          —
##D #  --------------------------------------------------------------
##D #
## End(Not run)



