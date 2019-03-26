library(deaR)


### Name: Departments
### Title: Data: Tomkins and Green (1988).
### Aliases: Departments
### Keywords: datasets

### ** Examples

# Example.
# Replication of results DEA1 in Tomkins and Green (1988)
data("Departments")
# Calculate Total income
Departments$Total_income <- Departments[,5]+Departments[,6]+Departments[,7]
data_example <- read_data(Departments,
                          inputs=9,
                          outputs=c(2,3,4,12))
result <- model_basic(data_example,
                      orientation="io",
                      rts="crs")
efficiencies(result) # Table 3 (p.156)
references(result) # Table 3 (p.157)




