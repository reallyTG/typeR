library(vcd)


### Name: plot.loddsratio
### Title: Plotting (Log) Odds Ratios
### Aliases: plot.loddsratio lines.loddsratio
### Keywords: category

### ** Examples

## 2 x 2 x k cases
data(CoalMiners, package = "vcd")
lor_CM <- loddsratio(CoalMiners)
plot(lor_CM)
lor_CM_df <- as.data.frame(lor_CM)

# fit linear models using WLS
age <- seq(20, 60, by = 5)
lmod <- lm(LOR ~ age, weights = 1 / ASE^2, data = lor_CM_df)
grid.lines(seq_along(age), fitted(lmod), gp = gpar(col = "blue", lwd = 2), default.units = "native")
qmod <- lm(LOR ~ poly(age, 2), weights = 1 / ASE^2, data = lor_CM_df)
grid.lines(seq_along(age), fitted(qmod), gp = gpar(col = "red", lwd = 2), default.units = "native")

## 2 x k x 2
lor_Emp <-loddsratio(Employment)
plot(lor_Emp)

## 4 way tables 
data(Punishment, package = "vcd")
mosaic(attitude ~ age + education + memory, data = Punishment,
highlighting_direction="left", rep = c(attitude = FALSE))

# visualize the log odds ratios, by education
plot(loddsratio(~ attitude + memory | education, data = Punishment))

# visualize the log odds ratios, by age
plot(loddsratio(~ attitude + memory | age, data = Punishment))

# visualize the log odds ratios, by age and education
plot(loddsratio(~ attitude + memory | age + education, data = Punishment))

# same, transposed
plot(loddsratio(~ attitude + memory | age + education, data = Punishment), transpose = TRUE)

# alternative visualization methods
image(loddsratio(Freq ~ ., data = Punishment))
tile(loddsratio(Freq ~ ., data = Punishment))

## cotabplots for more complex tables
cotabplot(Titanic, cond = c("Age","Sex"), panel = cotab_loddsratio)

cotabplot(Freq ~ opinion + grade + year | gender, data = JointSports, panel = cotab_loddsratio)
cotabplot(Freq ~ opinion + grade | year + gender, data = JointSports, panel = cotab_loddsratio)



