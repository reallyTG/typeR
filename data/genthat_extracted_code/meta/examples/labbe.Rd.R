library(meta)


### Name: labbe.metabin
### Title: L'Abbe plot for meta-analysis with binary outcomes
### Aliases: labbe labbe.metabin labbe.default
### Keywords: hplot

### ** Examples

data(Olkin95)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95,
                 studlab = paste(author, year),
                 sm = "RR", method = "I")

#
# L'Abbe plot for risk ratio
#
labbe(meta1)

# L'Abbe plot for odds ratio
#
labbe(meta1, sm = "OR")
# same plot
labbe(update(meta1, sm = "OR"))

# L'Abbe plot for risk difference
#
labbe(meta1, sm = "RD")

# L'Abbe plot on log odds scale
#
labbe(meta1, sm = "OR", backtransf = FALSE)

# L'Abbe plot for odds ratio with coloured lines for various treatment
# effects (defined as log odds ratios)
#
mycols <- c("blue", "yellow", "green", "red",
            "green", "yellow", "blue")
labbe(meta1, sm = "OR",
      comb.random = FALSE,
      TE.fixed = log(c(1 / 10, 1 / 5, 1 / 2,
                       1, 2, 5, 10)),
      col.fixed = mycols, lwd.fixed = 2)

# L'Abbe plot on log odds scale with coloured lines for various
# treatment effects (defined as log odds ratios)
#
labbe(meta1, sm = "OR",
      comb.random = FALSE,
      TE.fixed = log(c(1 / 10, 1 / 5, 1 / 2,
                       1, 2, 5, 10)),
      col.fixed = mycols, lwd.fixed = 2,
      backtransf = FALSE)



