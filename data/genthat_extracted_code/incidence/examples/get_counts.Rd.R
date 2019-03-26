library(incidence)


### Name: get_counts
### Title: Get counts from an incidence object
### Aliases: get_counts get_counts.incidence

### ** Examples

if (require(outbreaks)) { withAutoprint({
  dat  <- ebola_sim$linelist$date_of_onset
  gend <- ebola_sim$linelist$gender
  i    <- incidence(dat, interval = "week", groups = gend)
  
  ## Use with an object and no arguments gives the counts matrix
  head(get_counts(i))

  ## Specifying a position or group name will return a matrix subset to that
  ## group
  head(get_counts(i, 1L))
  head(get_counts(i, "f"))

  ## Specifying multiple groups allows you to rearrange columns
  head(get_counts(i, c("m", "f")))

  ## If you want a vector, you can use drop
  drop(get_counts(i, "f"))
})}



