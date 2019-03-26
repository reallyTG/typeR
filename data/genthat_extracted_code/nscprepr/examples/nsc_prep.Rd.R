library(nscprepr)


### Name: nsc_prep
### Title: Prepares and writes files for the National Student
###   Clearinghouse.
### Aliases: nsc_prep

### ** Examples


# create a data frame
df <- data.frame(first = c("Ruth", "William", "Sandra"),
             middle = c("Bader", "J.", "D"),
             last = c("Ginsburg", "Brennan", "O'Connor"),
             suffix = c("", "Jr.", ""),
             dob = c("3/15/1933", "5/25/1906", "03/26/1930"),
             id = c(1, 2, 3),
             search_date = c("1/1/1952", "6/01/1930", "8/5/1971"))

# prepare and write a file to the working directory that is ready for
# submission to the Clearinghouse's StudentTracker service
nsc <- nsc_prep(data = df, institution_code = "001509", branch_code = "00",
                institution_name = "Nova Southeastern University",
                inquiry_type = "SE")




