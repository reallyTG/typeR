library(opalr)


### Name: opal.login
### Title: Opal login
### Aliases: opal.login

### ** Examples

## No test: 
#### The below examples illustrate the different ways to login in opal ####

# explicite username/password login
o <- opal.login(username='administrator',password='password',url='https://opal-demo.obiba.org')
opal.logout(o)

# login using options
options(opal.username='administrator',
 opal.password='password',
 opal.url='https://opal-demo.obiba.org')
o <- opal.login()
opal.logout(o)

# login using ssl key pair
options(opal.opts=list(
   sslcert='my-publickey.pem',
   sslkey='my-privatekey.pem'))
o <- opal.login(url='https://opal-demo.obiba.org')
opal.logout(o)
## End(No test)



