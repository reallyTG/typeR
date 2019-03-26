library(jmv)


### Name: anovaRM
### Title: Repeated Measures ANOVA
### Aliases: anovaRM

### ** Examples

## Not run: 
##D 
##D data('bugs', package = 'jmv')
##D 
##D anovaRM(
##D     data = bugs,
##D     rm = list(
##D         list(
##D             label = 'Frightening',
##D             levels = c('Low', 'High'))),
##D     rmCells = list(
##D         list(
##D             measure = 'LDLF',
##D             cell = 'Low'),
##D         list(
##D             measure = 'LDHF',
##D             cell = 'High')),
##D     rmTerms = list(
##D         'Frightening'))
##D 
##D #
##D #  REPEATED MEASURES ANOVA
##D #
##D #  Within Subjects Effects
##D #  -----------------------------------------------------------------------
##D #                  Sum of Squares    df    Mean Square    F       p
##D #  -----------------------------------------------------------------------
##D #    Frightening              126     1         126.11    44.2    < .001
##D #    Residual                 257    90           2.85
##D #  -----------------------------------------------------------------------
##D #    Note. Type 3 Sums of Squares
##D #
##D #
##D #
##D #  Between Subjects Effects
##D #  -----------------------------------------------------------------
##D #                Sum of Squares    df    Mean Square    F    p
##D #  -----------------------------------------------------------------
##D #    Residual               954    90           10.6
##D #  -----------------------------------------------------------------
##D #    Note. Type 3 Sums of Squares
##D #
## End(Not run)



