library(Causata)


### Name: GetStratifiedSample
### Title: Gets a stratified sample of data from Causata
### Aliases: GetStratifiedSample

### ** Examples

# create some variables to query for
variables <- c('customer-id', 'total-spend')

# create a stratified sample given an initial query
# The commands below are commented out since they require an actual server connection
#connection <- Connect(hostname="server.causata.com",
#  username="user@gmail.com", password="enw8Q!mN")
#query <- Query() + Limit(500)
#df <- GetData(connection, query)

# The commands below are commented out since they require an actual server connection
#sampled.data <- GetStratifiedSample(connection, query, 
#  df[['has.purchase__Next.30.Days']], 'has.purchase__Next.30.Days', "true")
#table(sampled.data$weights)



