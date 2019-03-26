check_api = function() {
  skip_on_cran()

  code = NA
  try({
    code = httr::status_code(httr::GET(osem_endpoint()))
  })
  if (is.na(code)) skip('API not available')
}
