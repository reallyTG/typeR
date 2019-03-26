library(PKPDmisc)


### Name: ids_per_plot
### Title: split IDs into groups to use for subsequent plotting
### Aliases: ids_per_plot chunk chunk_grp chunk_list chunk_grp_list

### ** Examples

#chunking will provide the chunk index by splitting the data as evenly as possible
# into the number chunks specified
letters[1:9]

chunk(letters[1:9], 3)

letters[c(1, 1, 1:7)]
chunk(letters[c(1, 1, 1:7)], 3)

# sometimes you want to evenly chunk by unique values rather than purely balancing
chunk_grp(c(1, 1, 1:7), 3)

# a next step after chunking is splitting into a list, so this does thus for you

# chunk list will both split the data and keep the original values
chunk_list(letters[1:9], 3)

chunk_list(c(letters[1], letters[1], letters[1:7]), 3)

# in this case ragged arrays will be created to keep the number of 
# unique elements consistent as possible between chunks
chunk_grp_list(c(letters[1], letters[1], letters[1:7]), 3)



