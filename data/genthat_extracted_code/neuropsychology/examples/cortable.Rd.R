library(neuropsychology)


### Name: cortable
### Title: Correlation plot and table with significance stars.
### Aliases: cortable

### ** Examples

require(neuropsychology)

df <- personality

cortable(df)

# Extract the table
table <- cortable(df, returns="table")

# Extract the plot
plot <- cortable(df, returns="plot")

# Save table
write.csv(table, "correlation_table.csv")

# Save plot
ggplot2::ggsave("mycorrplot.png", plot)



