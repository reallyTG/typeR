library(REAT)


### Name: Goettingen
### Title: Employment data for Goettingen and Germany 2008-2017
### Aliases: Goettingen

### ** Examples

data(Goettingen)

# Location quotients for Goettingen 2017:
locq (Goettingen$Goettingen2017[2:16], Goettingen$Goettingen2017[1], 
Goettingen$BRD2017[2:16], Goettingen$BRD2017[1])

# Gini coefficient of regional specialization 2017:
gini.spec(Goettingen$Goettingen2017[2:16], Goettingen$BRD2017[2:16])

# Krugman coefficient of regional specialization 2017:
krugman.spec(Goettingen$Goettingen2017[2:16], Goettingen$BRD2017[2:16])



