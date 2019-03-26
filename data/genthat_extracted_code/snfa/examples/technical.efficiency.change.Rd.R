library(snfa)


### Name: technical.efficiency.change
### Title: Technical and efficiency change estimation
### Aliases: technical.efficiency.change

### ** Examples

data(panel.production)

results.df <- technical.efficiency.change(df = panel.production,
                                          input.var.names = c("X.1", "X.2", "X.3"),
                                          output.var.name = "y",
                                          firm.var.name = "Firm",
                                          time.var.name = "Year")

#Plot changes over time by firm
library(ggplot2)

ggplot(results.df, aes(Year, technical.change)) +
  geom_line(aes(color = Firm))
ggplot(results.df, aes(Year, efficiency.change)) +
  geom_line(aes(color = Firm))
ggplot(results.df, aes(Year, productivity.change)) +
  geom_line(aes(color = Firm))
  



