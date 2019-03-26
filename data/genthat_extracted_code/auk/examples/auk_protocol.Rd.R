library(auk)


### Name: auk_protocol
### Title: Filter the eBird data by protocol
### Aliases: auk_protocol

### ** Examples

system.file("extdata/ebd-sample.txt", package = "auk") %>%
  auk_ebd() %>%
  auk_protocol("Stationary")
  
# alternatively, without pipes
ebd <- auk_ebd(system.file("extdata/ebd-sample.txt", package = "auk"))
auk_protocol(ebd, "Stationary")



