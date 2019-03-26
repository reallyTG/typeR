## ----setup, echo=FALSE---------------------------------------------------
library("billboarder")

## ----barchart------------------------------------------------------------
library("billboarder")

df <- as.data.frame(table(sample(letters[1:5], 50, TRUE)))
df

billboarder() %>% 
  bb_barchart(data = df)

## ----stacked_bar---------------------------------------------------------
df <- as.data.frame(table(
  sample(letters[1:5], 50, TRUE),
  sample(LETTERS[1:5], 50, TRUE)
))
df.r <- reshape(data = df, idvar = "Var1", timevar = "Var2", direction = "wide")
df.r

billboarder() %>% 
  bb_barchart(data = df.r)

## ------------------------------------------------------------------------
billboarder() %>% 
  bb_barchart(
    data = df,
    mapping = bbaes(x = Var1, y = Freq, group = Var2)
  )

## ----linechart-----------------------------------------------------------
billboarder() %>% 
  bb_linechart(data = sin(seq(-pi, pi, length.out = 10)))

## ----area----------------------------------------------------------------
billboarder() %>% 
  bb_linechart(data = sin(seq(-pi, pi, length.out = 10)), type = "area-step")

## ----custom_x------------------------------------------------------------
df <- data.frame(
  var_x = seq(-pi, pi, length.out = 10),
  sin = sin(seq(-pi, pi, length.out = 10))
)
df

billboarder() %>% 
  bb_linechart(data = df, x = "var_x")

## ----line_date-----------------------------------------------------------
df <- data.frame(
  date = seq.Date(from = as.Date("2017-06-12"), by = "day", length.out = 10),
  var = rnorm(10)
)
df

billboarder() %>% 
  bb_linechart(data = df)

## ----scatter-------------------------------------------------------------
billboarder() %>% 
  bb_scatterplot(data = iris[, 1:2])

billboarder() %>% 
  bb_scatterplot(data = iris, x = "Petal.Length", y = "Petal.Width", group = "Species")

## ----pie-----------------------------------------------------------------
df <- data.frame(
  var = c("A", "B"),
  count = c(457, 987)
)

billboarder() %>% 
  bb_piechart(data = df)

## ----donut---------------------------------------------------------------
df <- data.frame(
  var = c("A", "B"),
  count = c(687, 246)
)

billboarder() %>% 
  bb_donutchart(data = df)

## ----gauge---------------------------------------------------------------
billboarder() %>% 
  bb_gaugechart(value = 64)

