library(RSocrata)


### Name: write.socrata
### Title: Write to a Socrata dataset (full replace or upsert)
### Aliases: write.socrata

### ** Examples

# Store user email and password
socrataEmail <- Sys.getenv("SOCRATA_EMAIL", "mark.silverberg+soda.demo@socrata.com")
socrataPassword <- Sys.getenv("SOCRATA_PASSWORD", "7vFDsGFDUG")

datasetToAddToUrl <- "https://soda.demo.socrata.com/resource/xh6g-yugi.json" # dataset

# Generate some data
x <- sample(-1000:1000, 1)
y <- sample(-1000:1000, 1)
df_in <- data.frame(x,y)

# Upload to Socrata
write.socrata(df_in,datasetToAddToUrl,"UPSERT",socrataEmail,socrataPassword)



