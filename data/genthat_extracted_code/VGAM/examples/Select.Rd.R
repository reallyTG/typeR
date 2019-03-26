library(VGAM)


### Name: Select
### Title: Select Variables for a Formula Response or the RHS of a Formula
### Aliases: Select subsetcol
### Keywords: models regression

### ** Examples

Pneumo <- pneumo
colnames(Pneumo) <- c("y1", "y2", "y3", "x2")  # The "y" variables are response
Pneumo$x1 <- 1; Pneumo$x3 <- 3; Pneumo$x <- 0; Pneumo$x4 <- 4  # Add these

Select(data = Pneumo)  # Same as with(Pneumo, cbind(y1, y2, y3))
Select(Pneumo, "x")
Select(Pneumo, "x", sort = FALSE, as.char = TRUE)
Select(Pneumo, "x", exclude = "x1")
Select(Pneumo, "x", exclude = "x1", as.char = TRUE)
Select(Pneumo, c("x", "y"))
Select(Pneumo, "z")  # Now returns a NULL
Select(Pneumo, " ")  # Now returns a NULL
Select(Pneumo, prefix = TRUE, as.formula = TRUE)
Select(Pneumo, "x", exclude = c("x3", "x1"), as.formula = TRUE,
       lhs = "cbind(y1, y2, y3)", rhs = "0")
Select(Pneumo, "x", exclude = "x1", as.formula = TRUE, as.char = TRUE,
       lhs = "cbind(y1, y2, y3)", rhs = "0")

# Now a 'real' example:
Huggins89table1 <- transform(Huggins89table1, x3.tij = t01)
tab1 <- subset(Huggins89table1,
               rowSums(Select(Huggins89table1, "y")) > 0)
# Same as
# subset(Huggins89table1, y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8 + y9 + y10 > 0)

# Long way to do it:
fit.th <-
   vglm(cbind(y01, y02, y03, y04, y05, y06, y07, y08, y09, y10) ~ x2 + x3.tij,
        xij = list(x3.tij ~ t01 + t02 + t03 + t04 + t05 + t06 + t07 + t08 +
                            t09 + t10 - 1),
        posbernoulli.t(parallel.t = TRUE ~ x2 + x3.tij),
        data = tab1, trace = TRUE,
        form2 = ~ x2 + x3.tij + t01 + t02 + t03 + t04 + t05 + t06 + t07 + t08 +
                                t09 + t10)
# Short way to do it:
Fit.th <- vglm(Select(tab1, "y") ~ x2 + x3.tij,
               xij = list(Select(tab1, "t", as.formula = TRUE,
                                 sort = FALSE, lhs = "x3.tij", rhs = "0")),
               posbernoulli.t(parallel.t = TRUE ~ x2 + x3.tij),
               data = tab1, trace = TRUE,
               form2 = Select(tab1, prefix = TRUE, as.formula = TRUE))



