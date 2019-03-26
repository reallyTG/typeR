## ------------------------------------------------------------------------
path_key_alice <- cyphr::ssh_keygen(password = FALSE)
path_key_bob <- cyphr::ssh_keygen(password = FALSE)

## ------------------------------------------------------------------------
data_dir <- file.path(tempdir(), "data")
dir.create(data_dir)
dir(data_dir)

## ------------------------------------------------------------------------
cyphr::data_admin_init(data_dir, path_user = path_key_alice)

## ------------------------------------------------------------------------
cyphr::data_admin_init(data_dir, path_user = path_key_alice)

## ------------------------------------------------------------------------
key <- cyphr::data_key(data_dir, path_user = path_key_alice)

## ------------------------------------------------------------------------
filename <- file.path(data_dir, "iris.rds")
cyphr::encrypt(saveRDS(iris, filename), key)
dir(data_dir)

## ----error = TRUE--------------------------------------------------------
readRDS(filename)

## ------------------------------------------------------------------------
head(cyphr::decrypt(readRDS(filename), key))

## ----error = TRUE--------------------------------------------------------
key_bob <- cyphr::data_key(data_dir, path_user = path_key_bob)

## ------------------------------------------------------------------------
cyphr::data_request_access(data_dir, path_user = path_key_bob)

## ------------------------------------------------------------------------
req <- cyphr::data_admin_list_requests(data_dir)
req

## ------------------------------------------------------------------------
cyphr::data_admin_authorise(data_dir, yes = TRUE, path_user = path_key_alice)

## ------------------------------------------------------------------------
cyphr::data_admin_list_requests(data_dir)

## ------------------------------------------------------------------------
cyphr::data_admin_list_keys(data_dir)

## ------------------------------------------------------------------------
key_bob <- cyphr::data_key(data_dir, path_user = path_key_bob)
head(cyphr::decrypt(readRDS(filename), key_bob))

## ----echo = FALSE, results = "hide"--------------------------------------
unlink(data_dir, recursive = TRUE)
dir.create(data_dir)

## ------------------------------------------------------------------------
cyphr::data_admin_init(data_dir, path_user = path_key_alice)

## ------------------------------------------------------------------------
key <- cyphr::data_key(data_dir, path_user = path_key_alice)

## ------------------------------------------------------------------------
cyphr::encrypt(saveRDS(iris, filename), key)

## ------------------------------------------------------------------------
hash <- cyphr::data_request_access(data_dir, path_user = path_key_bob)

## ------------------------------------------------------------------------
cyphr::data_admin_authorise(data_dir, yes = TRUE, path_user = path_key_alice)

## ------------------------------------------------------------------------
key <- cyphr::data_key(data_dir, path_user = path_key_bob)

## ------------------------------------------------------------------------
head(cyphr::decrypt(readRDS(filename), key))

## ------------------------------------------------------------------------
dir(data_dir, all.files = TRUE, no.. = TRUE)

## ------------------------------------------------------------------------
dir(file.path(data_dir, ".cyphr"))
names(cyphr::data_admin_list_keys(data_dir))

## ------------------------------------------------------------------------
h <- names(cyphr::data_admin_list_keys(data_dir))[[1]]
readRDS(file.path(data_dir, ".cyphr", h))

## ------------------------------------------------------------------------
h

## ----echo = FALSE, results = "hide"--------------------------------------
unlink(c(data_dir, path_key_alice, path_key_bob), recursive = TRUE)

