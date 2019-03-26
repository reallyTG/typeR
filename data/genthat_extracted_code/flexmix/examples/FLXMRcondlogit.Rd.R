library(flexmix)


### Name: FLXMRcondlogit
### Title: FlexMix Interface to Conditional Logit Models
### Aliases: FLXMRcondlogit
### Keywords: regression models

### ** Examples

if (require("mlogit")) {
  data("Catsup", package = "mlogit")
  ## To reduce the time needed for the example only a subset is used
  Catsup <- subset(Catsup, id %in% 1:100)
  Catsup$experiment <- seq_len(nrow(Catsup))
  vnames <- c("display", "feature", "price")
  Catsup_long <-
    reshape(Catsup,
            idvar = c("id", "experiment"),
            times = c(paste("heinz", c(41, 32, 28), sep = ""),
              "hunts32"),
            timevar = "brand",
            varying = matrix(colnames(Catsup)[2:13], nrow = 3, byrow = TRUE),
            v.names = vnames,
            direction = "long")
  Catsup_long$selected <- with(Catsup_long, choice == brand)
  Catsup_long <- Catsup_long[, c("id", "selected", "experiment", vnames, "brand")]
  Catsup_long$brand <- relevel(factor(Catsup_long$brand), "hunts32")
  set.seed(0808)
  flx1 <- flexmix(selected ~ display + feature + price + brand | id,
                  model = FLXMRcondlogit(strata = ~ experiment), 
                  data = Catsup_long, k = 1)
}



