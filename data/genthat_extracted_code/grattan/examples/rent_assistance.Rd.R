library(grattan)


### Name: rent_assistance
### Title: Rent assistance
### Aliases: rent_assistance

### ** Examples

# current annual rent assistance
rent_assistance()  

# current fortnightly payment
rent_assistance(Date = Sys.Date())  

# zero since no rent
rent_assistance(0, Date = "2016-01-02") 

# Rent assistance is payable at 75c for every dollar over min rent
rent_assistance(101, max_rate = 500, min_rent = 100)
rent_assistance(500, max_rate = 500, min_rent = 100)




