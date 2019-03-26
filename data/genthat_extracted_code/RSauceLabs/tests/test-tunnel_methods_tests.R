context("tunnel_methods_tests")
SLAccount <- account()

test_that("canGetTunnels", {
  tunnels <- getTunnels(SLAccount, "seleniumPipes")
  expect_true(inherits(tunnels, "list"))
})

test_that("canGetTunnel", {
  tunnels <- getTunnels(SLAccount, "seleniumPipes")
  if(length(tunnels) > 0){
    tunnel <- getTunnel(SLAccount, "seleniumPipes", tunnelID = tunnels[[1]])
    expect_true(inherits(tunnel, "list"))
  }
})

test_that("canDeleteTunnel", {
  tunnels <- getTunnels(SLAccount, "seleniumPipes")
  if(length(tunnels) > 0){
    res <- deleteTunnel(SLAccount, "seleniumPipes", tunnelID = tunnels[[1]])
    expect_true(res$result)
  }
}
)
