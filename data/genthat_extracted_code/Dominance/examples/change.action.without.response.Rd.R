library(Dominance)


### Name: change.action.without.response
### Title: changes kind of actions for all action without response
### Aliases: change.action.without.response
### Keywords: ~kwd1 ~kwd2

### ** Examples


data(data_ADI)
new_data=change.action.without.response(data_ADI,3,9,
          newaction=data.frame("name.of.action"="test",
          "action.number"=10,"classification"=2,"weighting"=3))
new_data



