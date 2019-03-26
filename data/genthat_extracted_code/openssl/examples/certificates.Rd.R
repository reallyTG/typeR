library(openssl)


### Name: cert_verify
### Title: X509 certificates
### Aliases: cert_verify download_ssl_cert ca_bundle

### ** Examples

# Verify the r-project HTTPS cert
chain <- download_ssl_cert("cloud.r-project.org", 443)
print(chain)
cert_data <- as.list(chain[[1]])
print(cert_data$pubkey)
print(cert_data$alt_names)
cert_verify(chain, ca_bundle())

# Write cert in PEM format
cat(write_pem(chain[[1]]))



