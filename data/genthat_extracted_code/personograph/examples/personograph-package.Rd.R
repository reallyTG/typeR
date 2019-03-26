library(personograph)


### Name: personograph-package
### Title: Generate personograph plots from data
### Aliases: personograph-package

### ** Examples

# Example data
data <- read.table(textConnection('
          name ev.trt n.trt ev.ctrl n.ctrl
1     Auckland     36   532      60    538
2        Block      1    69       5     61
3        Doran      4    81      11     63
4        Gamsu     14   131      20    137
5     Morrison      3    67       7     59
6 Papageorgiou      1    71       7     75
7      Tauesch      8    56      10     71
'
), header=TRUE)

sm <- "RR" # The outcome measure (either Relative Risk or Odds Ratio)
if (requireNamespace("meta", quietly = TRUE)) { # use meta if available
    ## Calculate the pooled OR or RR point estimate
    m <- with(data, meta::metabin(ev.trt, n.trt, ev.ctrl, n.ctrl, sm=sm))
    point <- exp(m$TE.random) # meta returns random effects estimate on the log scale
} else {
    # Calculated Random Effects RR, using the meta package
    point <- 0.5710092
}

# Approximate the Control Event Rates using a weighted median
cer <- w.approx.cer(data[["ev.ctrl"]], data[["n.ctrl"]])

# Calculate the Intervention Event Rates (IER) from the CER and point estimate
ier <- calc.ier(cer, point, sm)

# Calcaulte the "uplift" statistics
# Note that this depends on the direction of the outcome effect (higher_is_better)
u <- uplift(ier, cer, higher_is_better=FALSE)
plot(u, fig.title="Example", fig.cap="Example")



