library(DataCombine)


### Name: MoveFront
### Title: Move variables to the front of a data frame.
### Aliases: MoveFront

### ** Examples

# Create fake data
A <- B <- C <- 1:50
OldOrder <- data.frame(A, B, C)

# Move C to front
NewOrder1 <- MoveFront(OldOrder, "C")
names(NewOrder1)

# Move B and A to the front
NewOrder2 <- MoveFront(OldOrder, c("B", "A"))
names(NewOrder2)

## Non-exact matching (example from Felix Hass)
 # Create fake data
 df <- data.frame(dummy = c(1,0), Name = c("Angola", "Chad"),
                 DyadName = c("Government of Angola - UNITA",
                 "Government of Chad - FNT"),
                 Year = c("2002", "1992"))

 df <- MoveFront(df, c("Name", "Year"), exact = FALSE)

 names(df)

 df <- MoveFront(df, c("Name", "Year"), exact = TRUE)

 names(df)




