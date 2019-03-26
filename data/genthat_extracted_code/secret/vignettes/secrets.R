## ------------------------------------------------------------------------
library(secret)

## ----eval = FALSE--------------------------------------------------------
#  # This is optional - only do this if you want to change the default location
#  Sys.setenv(USER_KEY = "path/to/private/key")

## ------------------------------------------------------------------------
library(secret)
try(local_key(), silent = TRUE)

## ------------------------------------------------------------------------
vault <- file.path(tempdir(), ".vault")
dir.create(vault)
create_vault(vault)

## ------------------------------------------------------------------------
dir(vault)

## ---- eval = FALSE-------------------------------------------------------
#  pkg_root <- "/path/to/package"
#  create_package_vault(pkg_root)

## ------------------------------------------------------------------------
key_dir <- file.path(system.file(package = "secret"), "user_keys")
alice_public_key <- file.path(key_dir, "alice.pub")
alice_private_key <- file.path(key_dir, "alice.pem")
openssl::read_pubkey(alice_public_key)

## ------------------------------------------------------------------------
add_user("alice", alice_public_key, vault = vault)

## ------------------------------------------------------------------------
secret_to_keep <- c(password = "my_password")
add_secret("secret_one", secret_to_keep, users = "alice", vault = vault)

## ------------------------------------------------------------------------
get_secret("secret_one", key = alice_private_key, vault = vault)

## ------------------------------------------------------------------------
normalizePath("~/.ssh", mustWork = FALSE)

