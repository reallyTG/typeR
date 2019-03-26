## ----eval=FALSE----------------------------------------------------------
#  # without keyringr - password saved in R code.
#  odbcDriverConnect("driver={SQL Server};server=myDbServer.mycompany.com;database=mydb;uid=myuser;pwd=P@ssw0rd")
#  
#  # Better approach (windows):
#  #   Using decrypt_dpapi_pw, we can supply a file containing an encrypted string.
#  odbcDriverConnect(paste0("driver={SQL Server};server=myDbServer.mycompany.com;database=mydb;uid=myuser;pwd=", decrypt_dpapi_pw("myEncryptedPw.txt")))

## ---- eval=FALSE---------------------------------------------------------
#  # build up path to password
#  credential_label <- "MYDB_MYUSER"
#  credential_path <- paste(Sys.getenv("USERPROFILE"), '\\DPAPI\\passwords\\', Sys.info()["nodename"], '\\', credential_label, '.txt', sep="")
#  mypwd <- decrypt_dpapi_pw(credential_path)
#  print(mypwd)

## ---- eval=FALSE---------------------------------------------------------
#  mypwd <- decrypt_kc_pw("mydb_myuser")
#  print(mypwd)

## ---- eval=FALSE---------------------------------------------------------
#  mypwd <- decrypt_gk_pw("db mydb user myuser")
#  print(mypwd)

