## ---- echo=FALSE, results='asis'-----------------------------------------
some_login_function <- function(username, password, separate_param) {
     ## does something with username/password
     ## ... 

      message(sprintf("some_login_function() received username = '%s' and password = '%s' and separate_param = '%s'\n   (obviously wouldn't normally output like this)", username, password, separate_param))

     return(TRUE)
}

## ---- echo=FALSE, results='asis'-----------------------------------------

## reminder, tempdir() is only for vignette. Normally use:
#  CREDS_PARENT_FOLDER <- "~/.rcreds"
CREDS_PARENT_FOLDER <- tempdir()


library(rcreds)

set_default_rcreds_folder(file.path(CREDS_PARENT_FOLDER, "credential_files"))
set_default_rcreds_folder(file.path(CREDS_PARENT_FOLDER, "db_credential_files"), DB=TRUE)
set_default_rcreds_key_folder(folder = file.path(CREDS_PARENT_FOLDER, "key_files"))

## ---- echo=FALSE, results='asis'-----------------------------------------

## reminder, tempdir() is only for vignette. Normally use:
#  CREDS_PARENT_FOLDER <- "~/.rcreds"
CREDS_PARENT_FOLDER <- tempdir()

## in your .Rprofile, you should set the default folders.
## Replace CREDS_PARENT_FOLDER with correct folder, such as "~/.rcreds"
rcreds::set_default_rcreds_folder(file.path(CREDS_PARENT_FOLDER, "credential_files"))
rcreds::set_default_rcreds_folder(file.path(CREDS_PARENT_FOLDER, "db_credential_files"), DB=TRUE)
rcreds::set_default_rcreds_key_folder(folder=file.path(CREDS_PARENT_FOLDER, "key_files"))

library(rcreds)

creds_info <- "for_app123_login" ## some description that will be part of the filename
key_object <- create_key(bytes=32, depth=8, verbose=TRUE)

## Save Credentials
write_credentials_to_file(username="cosmo", password="too many secrets", key=key_object, info.file_name = creds_info, verbose=TRUE)

## Save key file to a different location. 
save_key(key=key_object, zArchive_existing=FALSE, overwrite_existing=TRUE, verbose=TRUE)


## ---- echo=FALSE, results='asis'-----------------------------------------

## reminder, tempdir() is only for vignette. Normally use:
#  CREDS_PARENT_FOLDER <- "~/.rcreds"
CREDS_PARENT_FOLDER <- tempdir()

key_file   <- file.path(CREDS_PARENT_FOLDER, "key_files", ".crypt_key.rds")
creds_file <- file.path(CREDS_PARENT_FOLDER, "credential_files", "for_app123_login.credentials.creds")


creds <- read_credentials_from_file(file_full_path=creds_file, key=key_file)

## SHOWING CONTENTS FOR DEMO PURPOSES. NORMALLY DON'T DO THIS
print(creds)

## Use the credentials by refering to the elements by name
some_login_function(username = creds$username, password=creds$password, separate_param="plain example")

## altenatively can use do.call
do.call(some_login_function, c(creds, list(separate_param="do.call example")))

