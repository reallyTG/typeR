library(vcr)


### Name: Cassette
### Title: Cassette handler
### Aliases: Cassette
### Keywords: internal

### ** Examples

library(vcr)
vcr_configure(dir = tempdir())

res <- Cassette$new(name = "bob")
res$file()
res$originally_recorded_at()
res$recording()
res$serializable_hash()
res$eject()
res$should_remove_matching_existing_interactions()
res$storage_key()
res$match_requests_on

# record all requests
res <- Cassette$new("foobar", record = "all")
res$eject()

# cleanup
unlink(file.path(tempdir(), c("bob.yml", "foobar.yml")))



