library(mkin)


### Name: [.mmkin
### Title: Subsetting method for mmkin objects
### Aliases: [.mmkin

### ** Examples

  # Only use one core, to pass R CMD check --as-cran
  fits <- mmkin(c("SFO", "FOMC"), list(B = FOCUS_2006_B, C = FOCUS_2006_C),
                cores = 1, quiet = TRUE)
  fits["FOMC", ]
  fits[, "B"]
  fits["SFO", "B"]

  head(
    # This extracts an mkinfit object with lots of components
    fits[["FOMC", "B"]] 
  )

  head(
  # The same can be achieved by
    fits["SFO", "B", drop = TRUE]
  )



