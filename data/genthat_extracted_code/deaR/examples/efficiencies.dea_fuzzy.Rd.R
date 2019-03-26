library(deaR)


### Name: efficiencies.dea_fuzzy
### Title: Efficiencies
### Aliases: efficiencies.dea_fuzzy

### ** Examples

# Replication results model DEA1 in Tomkins and Green (1988)
data("Departments")
# Calculate Total income
Departments$Total_income <- Departments[,5]+Departments[,6]+Departments[,7] 
data_DEA1 <- read_data(Departments,
                       inputs=9,
                       outputs=c(2,3,4,12))
result <- model_basic(data_DEA1, 
                      orientation="io",
                      rts="crs")
efficiencies(result) # Table 3 (p.156) 
 



