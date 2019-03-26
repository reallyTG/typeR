## ----partial-tables------------------------------------------------------
data(Titanic, package = "datasets")
partial_tables <- margin.table(Titanic, c(2,4,1))
ftable(partial_tables)

## ----mantelhaen----------------------------------------------------------
mantelhaen.test(partial_tables)

## ----power---------------------------------------------------------------
library(samplesizeCMH)

power.cmh.test(
  p1 = apply(partial_tables, 3, prop.table, 2)[1,],
  p2 = apply(partial_tables, 3, prop.table, 2)[3,],
  N = sum(Titanic),
  power = NULL,
  s = apply(partial_tables[,1,],2,sum) / apply(partial_tables,3,sum),
  t = apply(partial_tables, 3, sum) / sum(Titanic)
)


## ----contraceptives-display----------------------------------------------
data(contraceptives, package = "samplesizeCMH")
ftable(contraceptives)

## ----contraceptives-mh---------------------------------------------------
mantelhaen.test(contraceptives)

## ----contraceptives-effect.size------------------------------------------
vpower <- Vectorize(power.cmh.test, "theta", SIMPLIFY = FALSE)

thetas <- seq(1.05,1.5,0.05)

power_list <- vpower(
  theta = thetas,
  p2 = contraceptives[1,2,] / apply(contraceptives[,2,],2,sum),
  N = sum(contraceptives),
  power = NULL,
  s = 1/11,
  t = apply(contraceptives, 3, sum) / sum(contraceptives),
  alternative = "greater"
)

powers <- sapply(power_list, "[[", "power")

names(powers) <- thetas

powers

## ----contraceptives-plot, fig.width = 6, fig.height = 4, fig.align = 'center'----
plot(y = powers, x = thetas, main = "Power curve as a function of effect size")
abline(h = 0.95, col = "gold")
abline(h = 0.90, col = "red")
abline(h = 0.80, col = "blue")

legend(
  "bottomright", 
  legend = c("95%", "90%", "80%"), 
  col = c("gold", "red", "blue"),
  bty = "n",
  lty = c(1,1),
  title = "Power level"
  )

