library(lsr)


### Name: who
### Title: Contents of workspace
### Aliases: who

### ** Examples

### Example 1 ###

my.number <- 4
my.name <- "Dan"

# display the workspace:
who()
#
#  -- Name --      -- Class --   -- Size --
#  my.name         character     1         
#  my.number       numeric       1
#


### Example 2 ###

# create a data frame
dataset <- data.frame( hi = c( "hello","cruel","world" ), 
                       pi = c( 3,1,4 ) )

# now display the workspace:
who()
#
#  -- Name --      -- Class --   -- Size --
#  dataset         data.frame    3 x 2     
#  my.name         character     1         
#  my.number       numeric       1
#

# expand the data frame:
who( expand = TRUE )
#
#  -- Name --      -- Class --   -- Size --
#  dataset         data.frame    3 x 2     
#   $hi            factor        3         
#   $pi            numeric       3
#  my.name         character     1         
#  my.number       numeric       1
#

### Example 3 ###

# add a function to the workspace
quadruple <- function(x) { x*4 }

# add a formula to the workspace
my.formula <- blah ~ blah + blah 

# now display the workspace:
who()
#
#  -- Name --      -- Class --   -- Size --
#  dataset         data.frame    3 x 2               
#  my.formula      formula                 
#  my.name         character     1         
#  my.number       numeric       1         
#  quadruple       function                
#




