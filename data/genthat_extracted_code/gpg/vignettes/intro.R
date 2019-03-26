## ---- echo = FALSE, message = FALSE-----------------------------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
library(gpg)
options(width = 120, max.print = 100)

gpg_list_keys <- function(...){
  gpg::gpg_list_keys(...)[c("id", "name", "email")]
}

## ---------------------------------------------------------------------------------------------------------------------
str(gpg_info())

## ---------------------------------------------------------------------------------------------------------------------
gpg_restart(home = tempdir())

## ---------------------------------------------------------------------------------------------------------------------
gpg_list_keys()

## ---- warning=FALSE---------------------------------------------------------------------------------------------------
(mykey <- gpg_keygen(name = "Jerry", email = "jerry@gmail.com"))
gpg_list_keys()

## ---------------------------------------------------------------------------------------------------------------------
gpg_recv(id ="51716619E084DAB9")
(keyring <- gpg_list_keys())

## ---------------------------------------------------------------------------------------------------------------------
(secring <- gpg_list_keys(secret = TRUE))

## ---------------------------------------------------------------------------------------------------------------------
gpg_import("https://stallman.org/rms-pubkey.txt")

## ---------------------------------------------------------------------------------------------------------------------
(rms_id <- gpg_list_keys("rms")$id)
gpg_recv(rms_id)
gpg_list_signatures(rms_id)

## ---------------------------------------------------------------------------------------------------------------------
str <- gpg_export(id = mykey)
cat(str)

## ---------------------------------------------------------------------------------------------------------------------
str <- gpg_export(id = mykey, secret = TRUE)
cat(str)

## ---------------------------------------------------------------------------------------------------------------------
gpg_delete('2C6464AF2A8E4C02')
gpg_list_keys()

## ---- message=FALSE---------------------------------------------------------------------------------------------------
myfile <- tempfile()
writeLines("This is a signed message", con = myfile)
sig <- gpg_sign(myfile)
writeLines(sig, "sig.gpg")
cat(sig)

## ---------------------------------------------------------------------------------------------------------------------
clearsig <- gpg_sign(myfile, mode = "clear")
writeLines(clearsig, "clearsig.gpg")
cat(clearsig)

## ---------------------------------------------------------------------------------------------------------------------
gpg_verify("sig.gpg", data = myfile)

## ---------------------------------------------------------------------------------------------------------------------
gpg_verify("clearsig.gpg")

## ----echo=FALSE-------------------------------------------------------------------------------------------------------
unlink(c("sig.gpg", "clearsig.gpg"))

## ---- message=FALSE---------------------------------------------------------------------------------------------------
# take out the spaces
johannes <- "6212B7B7931C4BB16280BA1306F90DE5381BA480"
gpg_recv(johannes)

## ---------------------------------------------------------------------------------------------------------------------
gpg_list_signatures(johannes)

## ---------------------------------------------------------------------------------------------------------------------
# Verify the file
library(curl)
curl_download('https://cran.r-project.org/bin/linux/debian/jessie-cran3/Release', 'Release')
curl_download('https://cran.r-project.org/bin/linux/debian/jessie-cran3/Release.gpg', 'Release.gpg')
gpg_verify('Release.gpg', 'Release')

## ---- echo = FALSE----------------------------------------------------------------------------------------------------
unlink('Release')
unlink('Release.gpg')

## ----message=FALSE----------------------------------------------------------------------------------------------------
jeroen <- '16C019F96112961CEB4F38B76094FC5BDA955A42'
gpg_recv(jeroen)
writeLines("Pizza delivery is on it's way!", "secret.txt")
msg <- gpg_encrypt("secret.txt", receiver = jeroen)
writeLines(msg, "msg.gpg")
unlink("secret.txt")
cat(msg)

## ---- error=TRUE, message=FALSE---------------------------------------------------------------------------------------
# This will error, we do not have this private key
gpg_decrypt("msg.gpg")

## ---------------------------------------------------------------------------------------------------------------------
writeLines("This is a test!", "secret.txt")
msg <- gpg_encrypt("secret.txt", receiver = mykey)
writeLines(msg, "msg.gpg")
cat(msg)

## ---- message=FALSE---------------------------------------------------------------------------------------------------
gpg_decrypt("msg.gpg")

## ---------------------------------------------------------------------------------------------------------------------
msg <- gpg_encrypt("secret.txt", receiver = jeroen, signer = mykey)
writeLines(msg, "msg.gpg")
cat(msg)

## ---- message=FALSE---------------------------------------------------------------------------------------------------
msg <- gpg_encrypt("secret.txt", receiver = mykey, signer = mykey)
writeLines(msg, "msg.gpg")
gpg_decrypt("msg.gpg")

## ---- echo = FALSE----------------------------------------------------------------------------------------------------
unlink("msg.gpg")
unlink("secret.txt")

