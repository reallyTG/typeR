library(incidence)


### Name: subset.incidence
### Title: Subsetting 'incidence' objects
### Aliases: subset.incidence "subset.incidence" "[.incidence" [.incidence

### ** Examples

## example using simulated dataset
if(require(outbreaks)) { withAutoprint({
  onset <- ebola_sim$linelist$date_of_onset

  ## weekly incidence
  inc <- incidence(onset, interval = 7)
  inc
  inc[1:10] # first 10 weeks
  plot(inc[1:10])
  inc[-c(11:15)] # remove weeks 11-15
  plot(inc[-c(11:15)])
})}




