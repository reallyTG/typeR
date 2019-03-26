library(RItools)


### Name: xtable.xbal
### Title: An 'xtable' method for 'xbal' objects
### Aliases: xtable.xbal

### ** Examples

data(nuclearplants)
require(xtable)

# Test balance on a variety of variables, with the 'pr' factor
# indicating which sites are control and treatment units, with
# stratification by the 'pt' factor to group similar sites
xb1 <- xBalance(pr ~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
                strata = data.frame(unstrat = factor(character(32)),
                pt = factor(nuclearplants$pt)),
                data = nuclearplants,
                report = c('adj.means', 'adj.mean.diffs',
                           'std.diffs', 'z.scores',
                           'chisquare.test', 'p.values'))

xb1.xtab <- xtable(xb1) # This table has right aligned columns

# Add user friendly names in the final table
rownames(xb1.xtab) <- c("Date", "Application to Contruction Time",
"License to Construction Time", "Net Capacity", "Northeast Region", "Cooling Tower",
"Babcock-Wilcox Steam", "Cumlative Plants")

print(xb1.xtab,
      add.to.row = attr(xb1.xtab, "latex.add.to.row"),
      hline.after = c(0, nrow(xb1.xtab)),
      sanitize.text.function = function(x){x},
      floating = TRUE,
      floating.environment = "sidewaystable")



