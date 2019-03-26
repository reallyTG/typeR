library(idealstan)


### Name: id_make
### Title: Create data to run IRT model
### Aliases: id_make

### ** Examples

# You can either use a pscl rollcall object or a vote/score matrix 
# where persons/legislators are in the rows
# and items/bills are in the columns

library(dplyr)

# First, using a rollcall object with the 114th Senate's rollcall votes:

data('senate114')

to_idealstan <-   id_make(score_data = senate114,
               outcome = 'cast_code',
               person_id = 'bioname',
               item_id = 'rollnumber',
               group_id= 'party_code',
               time_id='date',
               high_val='Yes',
               low_val='No',
               miss_val='Absent')




