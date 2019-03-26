library(Blaunet)


### Name: blau
### Title: Converts raw data into an object for Blau status analysis
### Aliases: blau

### ** Examples

##simple example
data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
##blau object will store whatever you compute
b <- niches(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions
##see active elements
print(b)
##compute global Blau statuses
b <- nodal.global(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions

##assume we don't care about the 'ideo' column
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp', exclude='ideo')
##compute niches like before
b <- niches(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions

##assume we only want income and educ parameters. Note the "c".
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp', dimensions=c('income', 'educ'))

##example with relational data
data(BSANet)
square.data <- BSANet$square.data
el <- BSANet$el

b <- blau(square.data, node.ids = 'person', ecology.ids = 'city', graph = el)
#compute dyadic statuses
b <- dyadic(b, dev.range = rep(1.5, 3)) # 3 is the number of dimensions




