library(adepro)


### Name: launch_adepro
### Title: launch_adepro - Launches the AdEPro application
### Aliases: launch_adepro
### Keywords: adepro

### ** Examples

## Not run: 
##D ## Launch application on localhost (127.0.0.1)
##D ## -------------------------------------------
##D ## By default launch_adepro starts the application on localhost
##D ## and a randomly selected port (e.g. 9876), in which case you can connect
##D ## to the running application by navigating your browser to
##D ## http://localhost:9876.
##D launch_adepro()
##D 
##D ## Launch application on a different host
##D ## --------------------------------------
##D ## You can also run the application on a different host
##D ## by specifying a hostname and port. Just make sure to
##D ## use an open port on your machine. Here "open" means
##D ## that the port should not be used by another service
##D ## and the port is opened by your firewall.
##D launch_adepro(host="your-hostname", port=8888)
##D 
##D 
##D ## Make the application available to your coworkers
##D ## ------------------------------------------------
##D ## within your local area network even without a
##D ## dedicated Shiny server. The value set through the
##D ## host argument says to accept any connection (not just from localhost).
##D ## Then take note of your local IP (if you are under linux,
##D ## you can see it through ifconfig). Say your IP is 192.168.1.70.
##D ## Your colleagues can use your app by inserting in the address
##D ## bar of their browser 192.168.1.70:8888, i.e. your IP followed
##D ## by : and the port number you selected.
##D launch_adepro(host="0.0.0.0", port=8888)
##D 
##D ## Launch application on a different browser
##D ## ----------------------------------------
##D ## To run the shiny app on a different browser than your standard browser
##D ## use the "browser" argument to set the path to the respective .exe file.
##D launch_adepro(browser = "C:/Program Files/Mozilla Firefox/firefox.exe")
##D 
##D 
##D ## Running AdEPro on test data
##D ## ---------------------------
##D write.csv(ae_data, file=paste(tempdir(), "\\ae_data.csv", sep=""), row.names=FALSE)
##D write.csv(patient_data, file=paste(tempdir(), "\\patient_data.csv", sep=""), row.names=FALSE)
##D ## Load ae_data.csv and patient_data.csv in the Upload data panel after
##D ## launching the application.
## End(Not run)




